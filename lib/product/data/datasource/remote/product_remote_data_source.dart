import 'package:todo_example/core/typeDefs/type_defs.dart';
import 'package:todo_example/product/data/model/product_model.dart';

abstract class ProductRemoteDataSource {
  Future<ProductModel> fetchProductRemoteDataSrc({int? skip});
  // FutureEither<ProductModel> fetchProductRemoteDataSrcEs2();
}
