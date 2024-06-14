import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:todo_example/auth/data/model/sig_in_response_model.dart';
import 'package:todo_example/core/error/exceptions.dart';
import 'package:todo_example/core/shared/local/local_key.dart';
import 'package:todo_example/core/shared/local/storage_service.dart';
import 'package:todo_example/core/typeDefs/type_defs.dart';

abstract class UserDataSource {
  String get storageKey;
  FutureEither<SiginResponse> fetchUser();
  Future<bool> saveUser({required SiginResponse user});
  Future<bool> deleteUser();
  Future<bool> has();
}

class UserLocalDatasource extends UserDataSource {
  UserLocalDatasource(this.storageService);
  final StorageService? storageService;
  @override
  FutureEither<SiginResponse> fetchUser() async {
    var data = await storageService!.get(key: storageKey);
    if (data == null) {
      AppServerException('User not found');
    }
    final userJson = jsonDecode(data.toString());
    return right(SiginResponse.fromJson(userJson));
  }

  @override
  Future<bool> saveUser({required SiginResponse user}) async {
    return await storageService!.set(storageKey, jsonEncode(user.toJson()));
  }

  @override
  Future<bool> has() async {
    return await storageService!.has(storageKey);
  }

  @override
  Future<bool> deleteUser() async {
    return await storageService!.remove(storageKey);
    
  }

  @override
  String get storageKey => LocalKeyData.USER;
}
