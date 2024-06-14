import 'package:todo_example/auth/data/model/sig_in_response_model.dart';
import 'package:todo_example/core/typeDefs/type_defs.dart';

abstract class UserCacheRepository {
  FutureEither<SiginResponse> fetchUser();
  Future<bool> saveUser({required SiginResponse user});
  Future<bool> deleteUser();
  Future<bool> hasUser();
}
