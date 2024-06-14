
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/core/services/local/shared_preferences_storage_service_provider.dart';
import 'package:todo_example/core/shared/catch_user_service/data/datasource/user_local_datasource.dart';
import 'package:todo_example/core/shared/catch_user_service/data/repositories/user_repository_impl.dart';
import 'package:todo_example/core/shared/catch_user_service/domain/repositories/user_cache_repository.dart';
import 'package:todo_example/core/shared/local/storage_service.dart';

final userDatasourceProvider = Provider.family<UserDataSource, StorageService>(
  (_, networkService) => UserLocalDatasource(networkService),
);

final userLocalRepositoryProvider = Provider<UserCacheRepository>((ref) {
  final storageService = ref.watch(storageServiceProvider);

  final datasource = ref.watch(userDatasourceProvider(storageService));

  final repository = UserRepositoryImpl(datasource);

  return repository;
});
