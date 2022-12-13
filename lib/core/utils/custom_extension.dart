import 'dart:collection';

import 'package:dio/dio.dart';

extension ErrorMerge on String {
  toErrorMessage(List<String> data) {
    var error = "";
    for (var element in data) {
      error += "$element\n";
    }
    if (error.endsWith("\n")) {
      error = error.substring(0, error.length - 1);
    }
    return error;
  }
}

extension MyDioError on DioError {
  String getErrorFromDio() {
    if (type == DioErrorType.connectTimeout ||
        type == DioErrorType.receiveTimeout ||
        type == DioErrorType.sendTimeout) {
      return 'No internet';
    }
    if (response != null && response!.data != null && response!.data! is Map) {
      //print(response!.data.toString());
      try {
        if (response!.data["message"] is List) {
          return ""
              .toErrorMessage(List<String>.from(response!.data["message"]));
        } else if (response!.data["error"] is LinkedHashMap) {
          final Map<String, dynamic> errorMap = response!.data["error"];
          if (errorMap.containsKey("errors") && errorMap["errors"] is String) {
            return errorMap["errors"];
          } else if (errorMap.containsKey("errors") &&
              errorMap["errors"] is List) {
            final List<dynamic> errors = errorMap["errors"] as List<dynamic>;
            return "".toErrorMessage(List<String>.from(errors));
          }
        } else if (response!.data["error"] is String) {
          return response!.data["error"];
        }
      } on Exception {
        return 'Unknown Error Occurred';
      }
    }
    return 'Unknown Error Occurred';
  }
}

extension StringExtension on String {
  String capitalize() {
    return length < 2
        ? toUpperCase()
        : "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
