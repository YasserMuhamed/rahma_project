import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rahma_project/core/helpers/shared_prefs_helper.dart';
import 'package:rahma_project/core/helpers/shared_prefs_keys.dart';

/// Provides a singleton Dio instance configured with headers and logging.
class DioFactory {
  DioFactory._();

  static Dio? _dio;
  static bool _isInitialized = false;

  /// Returns a configured Dio instance with headers and logging.
  static Future<Dio> getDio() async {
    const Duration timeOut = Duration(seconds: 30);
    if (_dio == null || !_isInitialized) {
      _dio = Dio();
      _dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut
        ..options.baseUrl = "https://www.google.com";

      await _addDioHeaders();
      _addDioInterceptor();
      _isInitialized = true;
    }
    return _dio!;
  }

  /// Sets default headers including token and language.
  static Future<void> _addDioHeaders() async {
    final String? userToken = await SharedPrefsHelper.getSecuredString(
      SharedPrefsKeys.tokenKey,
    );
    final String? language = await SharedPrefsHelper.getSecuredString(
      SharedPrefsKeys.languageKey,
    );
    final headers = {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      "Accept-Language": language ?? "en",
      'Authorization': 'Bearer $userToken',
    };
    headers.removeWhere((key, value) => value.contains("null"));
    _dio?.options.headers = headers;
    debugPrint("Initial Dio headers set: ${_dio?.options.headers}");
  }

  /// Updates the Authorization token in headers after login.
  static Future<void> setTokenIntoHeaderAfterLogin(String token) async {
    final String? language = await SharedPrefsHelper.getSecuredString(
      SharedPrefsKeys.languageKey,
    );
    _dio?.options.headers = {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      "Accept-Language": language ?? "en",
    };
    debugPrint("Token has been set into header after login");
  }

  /// Updates the Authorization token in headers after token refresh.
  static Future<void> setTokenIntoHeaderAfterRefresh(String token) async {
    final String? language = await SharedPrefsHelper.getSecuredString(
      SharedPrefsKeys.languageKey,
    );
    _dio?.options.headers = {
      // 'Accept': 'application/json',
      // 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
      "Accept-Language": language ?? "en",
    };
    debugPrint("Token has been set into header after refresh");
  }

  static void removeTokenFromHeader() =>
      _dio?.options.headers.remove('Authorization');

  /// Adds logging interceptor for requests and responses.
  static void _addDioInterceptor() {
    _dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    // _dio?.interceptors.add(
    //   AuthInterceptor(dio: _dio!, authLocalDataSource: AuthLocalDataSourceImpl(), authRemoteDataSource: AuthRemoteDataSourceImpl(_dio!)),
    // );
  }
}
