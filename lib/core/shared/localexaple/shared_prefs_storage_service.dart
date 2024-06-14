import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_example/core/shared/local/local_key.dart';

final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class SharedPreference {
  static Future setString({String? key, String? value}) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key!, value!);
  }

  static Future<String?> getString({String? key}) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key!);
  }

  static Future setBool({required String key, required bool value}) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setBool(key, value);
  }

  static Future<bool?> getBool({required String key}) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getBool(key);
  }

  static Future clear() async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(LocalKeyData.IS_LOGGED_IN_KEY);
    prefs.remove(LocalKeyData.ACCESS_TOKEN_KEY);
  }

  static Future has({String? key}) async {
    final SharedPreferences prefs = await _prefs;
    prefs.containsKey(key!);
  }

  static Future remove({String? key}) async {
    final SharedPreferences prefs = await _prefs;
    prefs.remove(key!);
  }

  static Future<Object?> getObject({String? key}) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.get(key!);
  }
}
