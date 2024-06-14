import 'package:todo_example/core/shared/local/local_key.dart';
import 'package:todo_example/core/shared/localexaple/shared_prefs_storage_service.dart';

class LocalData {
  static Future<String?> getAssetsToken() async {
    var ref = await SharedPreference.getString(key: LocalKeyData.ACCESS_TOKEN_KEY);
    return ref;
  }

  static Future setAssetsToken({String? value}) async {
    var ref = await SharedPreference.setString(
        key: LocalKeyData.ACCESS_TOKEN_KEY, value: value);
    return ref;
  }

  static Future<String?> getRefreshToken() async {
    var ref = await SharedPreference.getString(
        key: LocalKeyData.ACCESS_REFRESH_TOKEN_KEY);
    return ref;
  }

  static Future setRefreshToken({String? value}) async {
    var ref = await SharedPreference.setString(
        key: LocalKeyData.ACCESS_REFRESH_TOKEN_KEY, value: value);
    return ref;
  }

  static Future<bool> isLoggedIn() async {
    var ref = await SharedPreference.getBool(key: LocalKeyData.IS_LOGGED_IN_KEY);
    return ref ?? false; // Return false if the key is not found
  }

  static Future<void> setLoggedIn({bool? value}) async {
    await SharedPreference.setBool(
        key: LocalKeyData.IS_LOGGED_IN_KEY, value: value!);
  }

  static Future<String?> clearLocalStorage() async {
    await SharedPreference.clear();
    return null;
  }

  static Future<bool> hasUser() async {
    var ref = await SharedPreference.has(key: LocalKeyData.USER);
    return ref ?? false;
  }

  static Future saveUser({String? value}) async {
    var ref =
        await SharedPreference.setString(key: LocalKeyData.USER, value: value);
    return ref;
  }

  static Future<Object?> getUser() async {
    var ref = await SharedPreference.getObject(key: LocalKeyData.USER);
    return ref;
  }
}
