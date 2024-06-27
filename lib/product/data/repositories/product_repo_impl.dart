import 'dart:developer';
import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:todo_example/core/error/exceptions.dart';
import 'package:todo_example/core/error/failures.dart';
import 'package:todo_example/core/typeDefs/type_defs.dart';
import 'package:todo_example/product/data/datasource/local/product_local_data_source.dart';
import 'package:todo_example/product/data/datasource/remote/product_remote_data_source.dart';
import 'package:todo_example/product/data/model/product_model.dart';
import 'package:todo_example/product/domain/repositories/product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductRemoteDataSource? _productRemoteDataSource;
  final ProductLocalDataSource? _productLocalDataSource;

  ProductRepoImpl(
      {ProductRemoteDataSource? productRemoteDataSource,
      ProductLocalDataSource? productLocalDataSource})
      : _productRemoteDataSource = productRemoteDataSource,
        _productLocalDataSource = productLocalDataSource;

  @override
  FutureEither<ProductModel> productRepo({int? skip}) async {
    try {
      ProductModel productModelRemoteDataScr =
          await _productRemoteDataSource!.fetchProductRemoteDataSrc(skip: skip);
      // create local storage
      await _productLocalDataSource!
          .createLocalDataSource(product: productModelRemoteDataScr);
      return right(productModelRemoteDataScr);
    } on SocketException catch (e) {
      return left(AppServerFailure(
          '$e No internet connection and no local data available.'));
    } on AppServerException catch (e) {
      ProductModel? productModel =
          await _productLocalDataSource!.getLocalDataSource();
      if (productModel != null) {
        return right(productModel);
      } else {
        return left(AppServerFailure(e.message.toString()));
      }
    } catch (e) {
      return left(AppFailure(e.toString()));
    }
  }
}
