import 'package:todo_example/auth/data/model/sig_in_response_model.dart';
import 'package:todo_example/core/shared/catch_user_service/data/datasource/user_local_datasource.dart';
import 'package:todo_example/core/shared/catch_user_service/domain/repositories/user_cache_repository.dart';
import 'package:todo_example/core/typeDefs/type_defs.dart';

class UserRepositoryImpl extends UserCacheRepository {
  UserRepositoryImpl(this.dataSource);
  final UserDataSource dataSource;
  @override
  Future<bool> deleteUser() {
    return dataSource.deleteUser();
  }

  @override
  FutureEither<SiginResponse> fetchUser() {
    return dataSource.fetchUser();
  }

  @override
  Future<bool> hasUser() {
    return dataSource.has();
  }

  @override
  Future<bool> saveUser({required SiginResponse user}) {
    return dataSource.saveUser(user: user);
  }
}
