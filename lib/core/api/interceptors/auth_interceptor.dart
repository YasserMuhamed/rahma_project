// import 'package:dio/dio.dart';
// import 'package:rahma_project/core/api/dio_factory.dart';
// import 'package:rahma_project/core/utils/show_blocking_dialog.dart';

// import 'package:pretty_dio_logger/pretty_dio_logger.dart';

// class AuthInterceptor extends Interceptor {
//   final AuthRemoteDataSource authRemoteDataSource;
//   final AuthLocalDataSource authLocalDataSource;
//   final Dio dio;

//   AuthInterceptor({required this.authRemoteDataSource, required this.authLocalDataSource, required this.dio});

//   @override
//   void onError(DioException err, ErrorInterceptorHandler handler) async {
//     final isUnauthorized = err.response?.statusCode == 401;
//     final isRefreshCall = err.requestOptions.path.contains('refresh');

//     if (isUnauthorized && !isRefreshCall) {
//       try {
//         final refreshToken = await authLocalDataSource.getRefreshToken();

//         if (refreshToken != null && refreshToken.isNotEmpty) {
//           final refreshDio = Dio();
//           refreshDio.options.headers = {'Accept': 'application/json', 'Authorization': 'Bearer $refreshToken'};
//           refreshDio.interceptors.add(PrettyDioLogger(requestHeader: true, responseBody: true));

//           final refreshResult = await authRemoteDataSource.refreshToken(dio: refreshDio);
//           final newAccessToken = refreshResult.data?.accessToken;

//           if (newAccessToken != null) {
//             await authLocalDataSource.saveToken(newAccessToken);
//             await DioFactory.setTokenIntoHeaderAfterRefresh(newAccessToken);

//             final originalRequest = err.requestOptions;
//             originalRequest.headers['Authorization'] = 'Bearer $newAccessToken';

//             final options = err.requestOptions;
//             final clonedOptions = Options(method: options.method, headers: {...options.headers, 'Authorization': 'Bearer $newAccessToken'});
//             try {
//               final response = await dio.request(
//                 options.path,
//                 data: options.data,
//                 queryParameters: options.queryParameters,
//                 options: clonedOptions,
//               );
//               handler.resolve(response);
//             } catch (e) {
//               if (e is DioException) {
//                 return handler.next(e); // ← Propagate the actual retry error (e.g., 400)
//               }
//             }
//             return;
//           }
//         } else {
//           // refresh فشل فعلاً → logout
//           await _handleLogout(handler, err);
//         }
//       } catch (e) {
//         // refresh call نفسه ضرب exception → logout
//         await _handleLogout(handler, err);
//       }
//     } else {
//       // أي error مش 401 → pass عادي
//       handler.next(err);
//     }
//   }

//   Future<void> _handleLogout(ErrorInterceptorHandler handler, DioException err) async {
//     await authLocalDataSource.clearCache();

//     showBlockingDialog();

//     handler.next(err);
//   }
// }
