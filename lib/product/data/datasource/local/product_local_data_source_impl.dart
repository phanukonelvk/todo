import 'dart:convert';
import 'dart:developer';
import 'package:todo_example/core/shared/local/local_key.dart';
import 'package:todo_example/core/shared/local/storage_service.dart';
import 'package:todo_example/product/data/datasource/local/product_local_data_source.dart';
import 'package:todo_example/product/data/model/product_model.dart';

class ProductLocalDataSourceImpl implements ProductLocalDataSource {
  final StorageService? _storageService;

  ProductLocalDataSourceImpl({StorageService? storageService})
      : _storageService = storageService;

  @override
  Future<bool> createLocalDataSource({ProductModel? product}) async {
    try {
      await _storageService!.set(LocalKeyData.PRODUCT, jsonEncode(product));
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<ProductModel?> getLocalDataSource() async {
    try {
      var data = await _storageService!.get(key: LocalKeyData.PRODUCT);
      final userJson = jsonDecode(data.toString());
      // log("userJson : $userJson");
      return ProductModel.fromJson(userJson);
    } catch (e) {
      return null;
    }
  }
}
