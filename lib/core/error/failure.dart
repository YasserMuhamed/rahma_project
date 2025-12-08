import 'package:dio/dio.dart';

/// Base class for failures.
abstract class Failure {
  final String error;
  final int? code;
  const Failure({required this.error, this.code});
}

/// Represents server-related failures.
class ServerFailure extends Failure {
  ServerFailure({required super.error, super.code});

  /// Creates a [ServerFailure] from a DioException.
  factory ServerFailure.fromDioException(DioException error, {int code = 0}) {
    switch (error.type) {
      case DioExceptionType.badCertificate:
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          error.response?.statusCode ?? 0,
          error.response?.data,
        );
      case DioExceptionType.receiveTimeout:
        return ServerFailure(error: 'Server error', code: code);
      case DioExceptionType.cancel:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.connectionTimeout:
        return ServerFailure(
          error: 'Please check the internet and try again',
          code: code,
        );
      case DioExceptionType.unknown:
        return ServerFailure(error: 'Unknown error', code: code);
    }
  }

  /// Creates a [ServerFailure] from a response body and status code.
  factory ServerFailure.fromResponse(
    int statusCode,
    dynamic errorResponseBody,
  ) {
    if (errorResponseBody is Map<String, dynamic>) {
      // لو في errors object → نحلله ونرجع رسائله
      if (errorResponseBody.containsKey("errors")) {
        return ServerFailure(
          error: parseErrorResponse(errorResponseBody),
          code: statusCode,
        );
      }

      // لو في message عام
      if (errorResponseBody.containsKey("message")) {
        return ServerFailure(
          error: errorResponseBody["message"] ?? 'Unexpected error',
          code: statusCode,
        );
      }
    }

    if (statusCode == 404) {
      return ServerFailure(
        error: 'Not found, Please try again',
        code: statusCode,
      );
    } else if (statusCode == 500) {
      return ServerFailure(error: 'Server error', code: statusCode);
    } else if (statusCode >= 400 && statusCode < 500) {
      return ServerFailure(
        error: 'There was an error, Please try again',
        code: statusCode,
      );
    } else {
      return ServerFailure(error: 'Unexpected error', code: statusCode);
    }
  }
}

/// Parses error messages from a response map.
String parseErrorResponse(Map<String, dynamic> errorResponse) {
  final errors = errorResponse['errors'] as Map<String, dynamic>? ?? {};
  // ناخد كل القيم (اللي غالبًا بتكون Lists)
  final errorMessages = errors.values
      .expand((e) {
        if (e is List) return e;
        return [e.toString()];
      })
      .join('\n');

  return errorMessages.isNotEmpty
      ? errorMessages
      : errorResponse['message'] ?? 'Validation error';
}

/// Represents cache-related failures.
class CacheFailure extends Failure {
  CacheFailure({required super.error, required super.code});

  /// Creates a [CacheFailure] from an exception.
  factory CacheFailure.fromException(Exception error) {
    return CacheFailure(error: error.toString(), code: 0);
  }
}
