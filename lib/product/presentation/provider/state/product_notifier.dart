import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_example/core/shared/local/storage_service.dart';
import 'package:todo_example/core/shared/local/local_key.dart';
import 'package:todo_example/product/domain/repositories/product_repo.dart';
import 'package:todo_example/product/presentation/provider/state/product_state.dart';

class ProductNotifier extends StateNotifier<ProductState> {
  final ProductRepo? _productRepo;
  final StorageService? _storageService;

  ProductNotifier({ProductRepo? productRepo, StorageService? storageService})
      : _productRepo = productRepo,
        _storageService = storageService,
        super(ProductState(
          error: null,
          isloading: false,
          productModel: null,
        ));

  Future<void> fetchProducData() async {
    state = state.copyWith(
      error: null,
      isloading: true,
      prductModel: null,
    );
    var resuaft = await _productRepo!.productRepo(skip: 0);
    resuaft.fold(
      (l) async {
        state = state.copyWith(error: l.message, isloading: false);
      },
      (r) {
        state = state.copyWith(
          isloading: false,
          error: null,
          prductModel: r,
        );
      },
    );
  }

  Future<void> fetchToken() async {
    state = state.copyWith(isloading: true);

    var data =
        await _storageService!.getString(key: LocalKeyData.PRODUCT) as String;

    if (data.isNotEmpty) {
      state = state.copyWith(token: data, isloading: false, error: null);
    } else {
      state =
          state.copyWith(isloading: false, error: 'No data found in storage');
    }
  }
}
