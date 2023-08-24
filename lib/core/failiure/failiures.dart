

import 'package:equatable/equatable.dart';

import '../exceptions/exceptions.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

// General failures
class ServerFailure extends Failure {}

class NetworkFailure extends Failure {}

class UnHandledFailure extends Failure {}

class CanceledFailure extends Failure {}

class TimeoutFailure extends Failure {}

class ValidationFailure extends Failure {}

class SocketFailure extends Failure {}

Failure testExceptionFailure(Exception exception) {
  switch (exception.runtimeType) {
    case UnHandledException:
      return UnHandledFailure();
    case SocketException:
      return SocketFailure();
    case TimeoutException:
      return TimeoutFailure();
    case ServerException:
      return ServerFailure();
    case CanceledException:
      return CanceledFailure();
    case ValidationException:
      return ValidationFailure();
    default:
      return ServerFailure();
  }
}
