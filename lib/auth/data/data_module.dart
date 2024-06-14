import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:todo_example/auth/data/datasource/remote/auth_remote_data_source_impl.dart';
import 'package:todo_example/core/services/services_module.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>(
  (ref) => AuthRemoteDataSourceImpl(
    apiClientSvc: ref.watch(apiClientSvcProvider),
  ),
);
