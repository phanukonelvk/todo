import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_example/core/connection/app_api_path.dart';
import 'package:todo_example/core/connection/app_base_url.dart';

import 'package:todo_example/core/constants/app_text_message.dart';
import 'package:todo_example/core/error/exceptions.dart';
import 'package:todo_example/core/exceptions/dio_exceptions.dart';
import 'package:todo_example/core/shared/local/local_key.dart';
import 'package:todo_example/core/shared/local/storage_service.dart';
import 'package:todo_example/core/shared/localexaple/loacal_data.dart';
import 'package:todo_example/core/typeDefs/type_defs.dart';
import 'package:todo_example/core/utils/response_helper.dart';

abstract class ApiClientSvc {
  FutureEither get({String? path});

  Future<dynamic> post({String? path, Map<String, dynamic>? requestBody});

  Future<dynamic> put({String? path, dynamic payload});

  Future<dynamic> del({String? path});

  Future<dynamic> getMethodBearer({
    String? path,
    Map<String, dynamic>? queryParameters,
  });

  Future<dynamic> getQueryMethodBearer({String? path, dynamic queryParameters});

  Future<dynamic> postMethodBearer({String? path, dynamic payload});

  Future<dynamic> putMethodBearer({String? path, dynamic payload});

  Future<dynamic> delMethodBearer({String? path});

  Future<bool> refreshToken();

  void debugResponse({Response<dynamic>? response});

  void debugRequest({String? path, String? payload});
}

class ApiClientSvcImpl implements ApiClientSvc {
  final StorageService? _storageService;
  ApiClientSvcImpl({StorageService? storageService})
      : _storageService = storageService {
    BaseOptions options = BaseOptions(
      baseUrl: AppBaseURL.appBaseURL,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );
    _dio = Dio(options);
  }

  late Response? response;
  late Dio? _dio;

  Dio get dio => _dio!;

  Future<String?> _getBearerToken() async {
    return await _storageService!.get(key: LocalKeyData.ACCESS_TOKEN_KEY)
        as String?;
  }

  @override
  void debugRequest({String? path, dynamic payload}) {
    debugPrint(
        'REQUEST: ${_dio!.options.method} - [$path] - BODY: ${json.encode(payload)}');
  }

  @override
  void debugResponse({Response? response}) {
    debugPrint(
        "RESPONSE: ${response?.data != null ? json.encode(response!.data) : 'null'}");
  }

  @override
  Future del({String? path}) async {
    try {
      debugRequest(path: path, payload: null);
      var response = await _dio!.delete(path!);
      return response.data;
    } on DioError catch (dioError) {
      throw ResponseHelper.returnResponse(dioError);
    } catch (e) {
      throw AppServerException(AppTextMessage.somethingWrong);
    }
  }

  @override
  FutureEither get({String? path}) async {
    try {
      debugRequest(path: path!, payload: null);
      var response = await _dio!.get(path);
      debugResponse(response: response);
      return response.data;
    } on DioError catch (dioError) {
      throw ResponseHelper.returnResponse(dioError);
    } catch (e) {
      throw AppServerException(AppTextMessage.somethingWrong);
    }
  }

  @override
  Future post({String? path, Map<String, dynamic>? requestBody}) async {
    try {
      // debugRequest(path: path, payload: payload);
      var response = await _dio!.post(
        path!,
        data: requestBody,
        options: Options(
          headers: {'Content-Type': 'application/json; charset=UTF-8'},
        ),
      );
      debugResponse(response: response);
      return response.data;
    } on DioError catch (dioError) {
      debugPrint("DioError: ${dioError.message}");
      if (dioError.response != null) {
        debugPrint("DioError response data: ${dioError.response!.data}");
      }
      throw ResponseHelper.returnResponse(dioError);
    } catch (e) {
      throw AppServerException(AppTextMessage.somethingWrong);
    }
  }

  @override
  Future put({String? path, dynamic payload}) async {
    try {
      debugRequest(path: path, payload: payload);
      var response = await _dio!.put(path!, data: payload);
      debugResponse(response: response);
      return response.data;
    } on DioError catch (dioError) {
      throw ResponseHelper.returnResponse(dioError);
    } catch (e) {
      throw AppServerException(AppTextMessage.somethingWrong);
    }
  }

  @override
  Future<bool> refreshToken() async {
    final refreshToken = await LocalData.getRefreshToken();
    if (refreshToken == null) {
      return false;
    }
    var path = AppAPIPath.refreshToken;
    try {
      debugPrint("refreshToken $refreshToken");
      debugRequest(path: path, payload: null);
      var response = await _dio!.post(path,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $refreshToken",
          }));
      debugResponse(response: response);
      if (response.statusCode == 200) {
        LocalData.setRefreshToken(value: response.data['token']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      debugPrint("refreshToken error: $e");
      return false;
    }
  }

  @override
  Future delMethodBearer({String? path}) async {
    final token = await _getBearerToken();
    try {
      debugRequest(path: path, payload: null);
      var response = await _dio!.delete(path!,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      debugResponse(response: response);
      return response.data;
    } on DioError catch (dioError) {
      var dioExceptions = DioExceptions.fromDioError(dioError);
      if (dioExceptions.statusCode == 401) {
        bool isRefresh = await refreshToken();
        if (isRefresh) {
          return await getMethodBearer(path: path);
        }
        return dioError.response!.data;
      } else {
        throw ResponseHelper.returnResponse(dioError);
      }
    }
  }

  @override
  Future getMethodBearer(
      {String? path, Map<String, dynamic>? queryParameters}) async {
    final token = await _getBearerToken();
    try {
      debugRequest(path: path, payload: null);
      var response = await _dio!.get(path!,
          queryParameters: queryParameters,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      debugResponse(response: response);
      return response.data;
    } on DioError catch (dioError) {
      var dioExceptions = DioExceptions.fromDioError(dioError);
      if (dioExceptions.statusCode == 401) {
        bool isRefresh = await refreshToken();
        if (isRefresh) {
          return await getMethodBearer(path: path);
        }
        return dioError.response!.data;
      } else {
        throw ResponseHelper.returnResponse(dioError);
      }
    } catch (e) {
      throw AppServerException(AppTextMessage.somethingWrong);
    }
  }

  @override
  Future getQueryMethodBearer({String? path, dynamic queryParameters}) {
    throw UnimplementedError();
  }

  @override
  Future postMethodBearer({String? path, dynamic payload}) async {
    final token = await _getBearerToken();
    try {
      debugRequest(path: path, payload: payload);
      var response = await _dio!.post(path!,
          data: payload,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      debugResponse(response: response);
      return response.data;
    } on DioError catch (dioError) {
      var dioExceptions = DioExceptions.fromDioError(dioError);
      if (dioExceptions.statusCode == 401) {
        bool isRefresh = await refreshToken();
        if (isRefresh) {
          return await postMethodBearer(path: path, payload: payload);
        }
        return dioError.response!.data;
      } else {
        throw ResponseHelper.returnResponse(dioError);
      }
    } catch (e) {
      throw AppServerException(AppTextMessage.somethingWrong);
    }
  }

  @override
  Future putMethodBearer({String? path, dynamic payload}) async {
    final token = await _getBearerToken();
    try {
      debugRequest(path: path, payload: payload);
      var response = await _dio!.put(path!,
          data: payload,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token",
          }));
      debugResponse(response: response);
      return response.data;
    } on DioError catch (dioError) {
      var dioExceptions = DioExceptions.fromDioError(dioError);
      if (dioExceptions.statusCode == 401) {
        bool isRefresh = await refreshToken();
        if (isRefresh) {
          return await putMethodBearer(path: path, payload: payload);
        }
        return dioError.response!.data;
      } else {
        throw ResponseHelper.returnResponse(dioError);
      }
    } catch (e) {
      throw AppServerException(AppTextMessage.somethingWrong);
    }
  }
}
