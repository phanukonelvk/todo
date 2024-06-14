import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/core/services/local/shared_preferences_storage_service_provider.dart';
import 'package:todo_example/product/domain/domain_module.dart';
import 'package:todo_example/product/presentation/provider/state/product_notifier.dart';
import 'package:todo_example/product/presentation/provider/state/product_state.dart';

final productStateNotifier =
    StateNotifierProvider<ProductNotifier, ProductState>(
  (ref) => ProductNotifier(
      productRepo: ref.watch(producthRepoProvider),
      storageService: ref.read(storageServiceProvider)),
);
