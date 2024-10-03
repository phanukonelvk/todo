import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_example/core/connection/app_api_path.dart';
import 'package:todo_example/core/constants/app_text_message.dart';
import 'package:todo_example/core/error/exceptions.dart';
import 'package:todo_example/core/services/remote/api_client.dart';
import 'package:todo_example/core/utils/response_helper.dart';
import 'package:todo_example/product/data/datasource/remote/product_remote_data_source.dart';
import 'package:todo_example/product/data/model/product_model.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiClientSvc? _apiClientSvc;

  ProductRemoteDataSourceImpl({ApiClientSvc? apiClientSvc})
      : _apiClientSvc = apiClientSvc;
  @override
  Future<ProductModel> fetchProductRemoteDataSrc({int? skip}) async {
    try {
      // var page = {"skip": skip, "limit": AppTextMessage.PRODUCTS_PER_PAGE};
      var res = await _apiClientSvc!.getMethodBearer(
        path: AppAPIPath.productApiPath,
      );
      return ProductModel.fromJson(res);
    } on DioError catch (dioError) {
      debugPrint("productRemoteDataSrc dioError ${dioError.message}");
      throw ResponseHelper.returnResponse(dioError);
    } on SocketException catch (e) {
      debugPrint("productRemoteDataSrc SocketException e ${e.message}");
      throw SocketException(e.message.toString());
    } on AppServerException catch (e) {
      debugPrint("productRemoteDataSrc AppServerException e ${e.message}");
      throw AppServerException(e.message.toString());
    } catch (e) {
      debugPrint("productRemoteDataSrc catch e ${e.toString()}");
      throw AppServerException(e.toString());
    }
  }
}
