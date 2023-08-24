import 'package:dio/dio.dart';

class ServerException implements Exception {}

class NetworkException implements Exception {}

class UnHandledException implements Exception {}

class CanceledException implements Exception {}

class ClientException implements Exception {}

class TimeoutException implements Exception {}

class ValidationException implements Exception {}

class SocketException implements Exception {}

Exception testExceptionGlobal(DioError dioError) {
  switch (dioError.type) {
    case DioExceptionType.sendTimeout:
      throw TimeoutException();
    case DioExceptionType.unknown:
      throw UnHandledException();
    case DioExceptionType.cancel:
      throw CanceledException();
    case DioExceptionType.connectionTimeout:
      throw TimeoutException();
    case DioExceptionType.receiveTimeout:
      throw TimeoutException();
    default:
      throw ServerException();
  }
}
