import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/auth/data/data_module.dart';
import 'package:todo_example/auth/data/repositories/auth_repo_impl.dart';
import 'package:todo_example/auth/domain/repositories/auth_repo.dart';
import 'package:todo_example/core/services/local/shared_preferences_storage_service_provider.dart';
import 'package:todo_example/core/shared/catch_user_service/domain/provider/user_cache_provider.dart';

final authRepoProvider = Provider<AuthRepo>(
  (ref) => AuthRepoImpl(
    authRemoteDataSource: ref.watch(authRemoteDataSourceProvider),
    userCacheRepository: ref.read(userLocalRepositoryProvider),
    storageService: ref.read(storageServiceProvider),
  ),
);
