import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_example/core/constants/app_text_message.dart';
import 'package:todo_example/core/error/exceptions.dart';
import 'package:todo_example/core/exceptions/dio_exceptions.dart';

class ResponseHelper {
  static Exception returnResponse(DioError dioError) {
    try {
      // TODO: check dio error type and return exception
      if (dioError.error.runtimeType == SocketException) {
        return const SocketException(AppTextMessage.noInternetConnection);
      } else {
        var dioExceptions = DioExceptions.fromDioError(dioError);
        return AppServerException(dioExceptions.message);
      }
    } catch (e) {
      debugPrint("ERROR_Exception: $e");
      return AppServerException(e.toString());
      // return ServerException("SOMETHING_WRONG");
    }
  }
}