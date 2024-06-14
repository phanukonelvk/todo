import 'package:todo_example/product/data/model/product_model.dart';

class ProductState {
  final bool? _isloading;
  final String? _error;
  final ProductModel? _productModel;
  final String? _token;

  ProductState({
    bool? isloading,
    String? error,
    ProductModel? productModel,
    String? token,
  })  : _isloading = isloading,
        _error = error,
        _token = token,
        _productModel = productModel;

  bool? get isLoading => _isloading;
  String? get isError => _error;
  String? get token => _token;
  ProductModel? get isProduct => _productModel;

  ProductState copyWith({
    String? error,
    bool? isloading,
    String? token,
    ProductModel? prductModel,
  }) {
    return ProductState(
      error: error ?? _error,
      token: token ?? _token,
      isloading: isloading ?? _isloading,
      productModel: prductModel ?? _productModel,
    );
  }
}
