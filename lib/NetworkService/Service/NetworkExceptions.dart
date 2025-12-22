import 'dart:io';

import 'package:mbayat_user_app/Utils/allExport.dart';

class NetworkExceptions {
  static ApiResponse handleDioException(error) {
    if (error is DioException) {
      return ApiResponse(
        status: Status.error,
        code: error.response?.statusCode,
        data: error.response?.data,
        message: NetworkExceptions.getErrorMsg(error),
      );
    } else {
      return ApiResponse(
        status: Status.error,
        code: 0,
        data: null,
        message: NetworkExceptions.getErrorMsg(error),
      );
    }
  }

  static String getErrorMsg(error) {
    var errorMessage = "";
    if (error is DioException) {
      try {
        if (error is DioExceptionType) {
          switch (error) {
            case DioExceptionType.cancel:
              errorMessage = "Request Cancelled";
              break;
            case DioExceptionType.connectionTimeout:
              errorMessage = "Connection request timeout";
              break;
            case DioExceptionType.unknown:
              errorMessage = "No internet connection";
              break;
            case DioExceptionType.receiveTimeout:
              errorMessage = "Send timeout in connection with API server";
              break;
            case DioExceptionType.badResponse:
              switch (error.response?.statusCode) {
                case 400:
                  errorMessage = "Unauthorised request";
                  break;
                case 401:
                  errorMessage = "Unauthorised request";
                  break;
                case 403:
                  errorMessage = "Unauthorised request";
                  break;
                case 404:
                  errorMessage = "Not found";
                  break;
                case 409:
                  errorMessage = "Error due to a conflict";
                  break;
                case 408:
                  errorMessage = "Connection request timeout";
                  break;
                case 500:
                  errorMessage = "Internal Server Error";
                  break;
                case 503:
                  errorMessage = "Service unavailable";
                  break;
                default:
                  var responseCode = error.response?.statusCode;
                  errorMessage = "Received invalid status code: $responseCode";
              }
              break;
            case DioErrorType.sendTimeout:
              errorMessage = "Send timeout in connection with API server";
              break;
          }
        } else if (error is SocketException) {
          errorMessage = "No internet connection";
        } else {
          errorMessage = "Unexpected error occurred";
        }
        return errorMessage;
      } on FormatException catch (e) {
        // Helper.printError(e.toString());
        return "Unexpected error occurred:${e.message}";
      } catch (_) {
        return "Unexpected error occurred";
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return "Unexpected error occurred:${error.toString()}";
      } else {
        return "Unexpected error occurred";
      }
    }
  }
}
