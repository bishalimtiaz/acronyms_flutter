import 'dart:async';
import 'dart:io';

import 'package:acronyms_flutter/app/flavors/build_config.dart';
import 'package:dio/dio.dart';

import '/app/network/exceptions/api_exception.dart';
import '/app/network/exceptions/app_exception.dart';
import '/app/network/exceptions/network_exception.dart';
import '/app/network/exceptions/not_found_exception.dart';
import '/app/network/exceptions/service_unavailable_exception.dart';

Exception handleError(String error) {
  final logger = BuildConfig.instance.config.logger;
  logger.e("Generic exception: $error");

  return AppException(message: error);
}

Exception handleDioError(DioError dioError) {
  switch (dioError.type) {
    case DioErrorType.cancel:
      return AppException(message: "Request to API server was cancelled");
    case DioErrorType.receiveTimeout:
      return TimeoutException("Receive timeout in connection with API server");
    case DioErrorType.sendTimeout:
      return TimeoutException("Send timeout in connection with API server");
    case DioErrorType.connectionTimeout:
      return AppException(message: "Connection timeout with API server");
    case DioErrorType.badCertificate:
      return const CertificateException("Invalid server certificate");
    case DioErrorType.badResponse:
      return _parseDioErrorResponse(dioError);
    case DioErrorType.connectionError:
      return NetworkException("Failed to connect to the server");
    case DioErrorType.unknown:
      return AppException(message: "Unknown error occurred");
  }
}

Exception _parseDioErrorResponse(DioError dioError) {
  final logger = BuildConfig.instance.config.logger;

  int statusCode = dioError.response?.statusCode ?? -1;
  String? status;
  String? serverMessage;

  try {
    if (statusCode == -1 || statusCode == HttpStatus.ok) {
      statusCode = dioError.response?.data["statusCode"];
    }
    status = dioError.response?.data["status"];
    serverMessage = dioError.response?.data["message"];
  } catch (e, s) {
    logger.i("$e");
    logger.i(s.toString());

    serverMessage = "Something went wrong. Please try again later.";
  }

  switch (statusCode) {
    case HttpStatus.serviceUnavailable:
      return ServiceUnavailableException("Service Temporarily Unavailable");
    case HttpStatus.notFound:
      return NotFoundException(serverMessage ?? "", status ?? "");
    default:
      return ApiException(
          httpCode: statusCode,
          status: status ?? "",
          message: serverMessage ?? "");
  }
}
