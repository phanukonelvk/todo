import 'package:todo_example/product/data/model/product_model.dart';

abstract class ProductLocalDataSource {
  Future<bool> createLocalDataSource({ProductModel? product});
  Future<ProductModel?> getLocalDataSource();
}
