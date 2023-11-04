import 'package:dio/dio.dart';

abstract class RemoteErrors {
  final String errorMessage;

  RemoteErrors({required this.errorMessage});
}

class HandlerRemoteErrors extends RemoteErrors {
  HandlerRemoteErrors({required super.errorMessage});

  factory HandlerRemoteErrors.fromDioExceptionType(DioExceptionType dioError) {
    switch (dioError) {
      case DioExceptionType.connectionTimeout:
        return HandlerRemoteErrors(
            errorMessage: "Check your internet connection , try again");
      case DioExceptionType.sendTimeout:
        return HandlerRemoteErrors(errorMessage: "please try again");
      case DioExceptionType.receiveTimeout:
        return HandlerRemoteErrors(errorMessage: "please try again");
      case DioExceptionType.badCertificate:
        return HandlerRemoteErrors(errorMessage: "please try again later");
      case DioExceptionType.badResponse:
        return HandlerRemoteErrors(
            errorMessage:
                "We have New technical modifications, please try again later");
      case DioExceptionType.cancel:
        return HandlerRemoteErrors(errorMessage: "Request Canceled");
      case DioExceptionType.connectionError:
        return HandlerRemoteErrors(
            errorMessage: "Check your internet connection");
      case DioExceptionType.unknown:
        return HandlerRemoteErrors(
            errorMessage: "Some Things went wrong , try again");
    }
  }
}
