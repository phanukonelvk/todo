import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/core/services/local/shared_preferences_storage_service_provider.dart';
import 'package:todo_example/core/services/services_module.dart';
import 'package:todo_example/product/data/datasource/local/product_local_data_source.dart';
import 'package:todo_example/product/data/datasource/local/product_local_data_source_impl.dart';
import 'package:todo_example/product/data/datasource/remote/product_remote_data_source.dart';
import 'package:todo_example/product/data/datasource/remote/product_remote_data_source_impl.dart';

final productRemoteDataSourceProvider = Provider<ProductRemoteDataSource>(
  (ref) => ProductRemoteDataSourceImpl(
    apiClientSvc: ref.watch(apiClientSvcProvider),
  ),
);

final productLocalDataSourceProvider = Provider<ProductLocalDataSource>(
  (ref) => ProductLocalDataSourceImpl(
    storageService: ref.read(storageServiceProvider),
  ),
);
