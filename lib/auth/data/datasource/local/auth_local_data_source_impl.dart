// import 'dart:convert';

// import 'package:todo_example/auth/data/datasource/local/auth_local_data_source.dart';
// import 'package:todo_example/auth/data/model/user_info_model.dart';
// import 'package:todo_example/core/shared/local/local_key.dart';
// import 'package:todo_example/core/shared/localexaple/shared_prefs_storage_service.dart';

// class AuthLocalDataSourceImpl implements AuthLocalDataSource {
//   @override
//   Future<bool> createUserLocalDataSrc({UserInfoModel? request}) async {
//     try {
//       await SharedPreference.setString(
//           key: LocalKeyData.USER, value: jsonEncode(request));
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }

//   @override
//   Future<UserInfoModel?> getUserLocalDataSrc() async {
//     try {
//       var result = await SharedPreference.getString(key: LocalKeyData.USER);
//       return UserInfoModel.fromJson(jsonDecode(result!));
//     } catch (e) {
//       return null;
//     }
//   }
// }
