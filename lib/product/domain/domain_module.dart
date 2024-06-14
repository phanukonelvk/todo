import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/product/data/data_module.dart';
import 'package:todo_example/product/data/repositories/product_repo_impl.dart';
import 'package:todo_example/product/domain/repositories/product_repo.dart';

final producthRepoProvider = Provider<ProductRepo>(
  (ref) => ProductRepoImpl(
    productRemoteDataSource: ref.watch(productRemoteDataSourceProvider),
    productLocalDataSource: ref.watch(productLocalDataSourceProvider),
  ),
);
