import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_example/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:todo_example/auth/data/model/refresh_token_model.dart';
import 'package:todo_example/auth/data/model/sig_in_model.dart';
import 'package:todo_example/auth/data/model/sig_in_response_model.dart';
import 'package:todo_example/core/connection/app_api_path.dart';
import 'package:todo_example/core/error/exceptions.dart';
import 'package:todo_example/core/services/remote/api_client.dart';
import 'package:todo_example/core/utils/response_helper.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClientSvc? _apiClientSvc;

  AuthRemoteDataSourceImpl({ApiClientSvc? apiClientSvc})
      : _apiClientSvc = apiClientSvc;

  @override
  Future<SiginResponse> signInSignUpRemoteDataSrc(
      {SiginRequest? request}) async {
    debugPrint("signInSignUpRemoteDataSrc called");
    if (_apiClientSvc == null) {
      debugPrint("ApiClientSvc is not initialized");
      throw AppServerException("ApiClientSvc is not initialized");
    }
    try {
      debugPrint('Payload: ${jsonEncode(request)}}');
      var response = await _apiClientSvc.post(
        path: AppAPIPath.signInSingUpAPIPath,
        requestBody: {
          "username": request!.username,
          "password": request.password,
        },
      );
      return SiginResponse.fromJson(response);
    } on DioError catch (dioError) {
      debugPrint("signInSignUpRemoteDataSrc dioError ${dioError.message}");
      throw ResponseHelper.returnResponse(dioError);
    } on SocketException catch (e) {
      debugPrint("signInSignUpRemoteDataSrc SocketException e ${e.message}");
      throw SocketException(e.message.toString());
    } on AppServerException catch (e) {
      debugPrint("signInSignUpRemoteDataSrc AppServerException e ${e.message}");
      throw AppServerException(e.message.toString());
    } catch (e) {
      debugPrint("signInSignUpRemoteDataSrc catch e 123${e.toString()}");
      throw AppServerException(e.toString());
    }
  }

  @override
  Future<RefreshTokenModel> refreshToken() async {
    try {
      var res = await _apiClientSvc!
          .postMethodBearer(path: AppAPIPath.refreshToken, payload: null);
      return RefreshTokenModel.fromJson(res);
    } on DioError catch (dioError) {
      debugPrint("signInSignUpRemoteDataSrc dioError ${dioError.message}");
      throw ResponseHelper.returnResponse(dioError);
    } on SocketException catch (e) {
      debugPrint("signInSignUpRemoteDataSrc SocketException e ${e.message}");
      throw SocketException(e.message.toString());
    } on AppServerException catch (e) {
      debugPrint("signInSignUpRemoteDataSrc AppServerException e ${e.message}");
      throw AppServerException(e.message.toString());
    } catch (e) {
      debugPrint("signInSignUpRemoteDataSrc catch e ${e.toString()}");
      throw AppServerException(e.toString());
    }
  }

  /*
  @override
  Future<SiginResponse> signInSignUpRemoteDataSrc(
      {SiginResponse? request}) async {
    debugPrint("signInSignUpRemoteDataSrc called");
    if (_apiClientSvc == null) {
      debugPrint("ApiClientSvc is not initialized");
      throw AppServerException("ApiClientSvc is not initialized");
    }
    try {
      debugPrint('Payload: ${json.encode({
            'username': username,
            'password': password,
          })}');
      var response = await _apiClientSvc
          .post(path: AppAPIPath.signInSingUpAPIPath, payload: request!.toJson(),);
      return SiginResponse.fromJson(response);
    } on DioError catch (dioError) {
      debugPrint("signInSignUpRemoteDataSrc dioError ${dioError.message}");
      throw ResponseHelper.returnResponse(dioError);
    } on SocketException catch (e) {
      debugPrint("signInSignUpRemoteDataSrc SocketException e ${e.message}");
      throw SocketException(e.message.toString());
    } on AppServerException catch (e) {
      debugPrint("signInSignUpRemoteDataSrc AppServerException e ${e.message}");
      throw AppServerException(e.message.toString());
    } catch (e) {
      debugPrint("signInSignUpRemoteDataSrc catch e ${e.toString()}");
      throw AppServerException(e.toString());
    }
  }
  */
}
