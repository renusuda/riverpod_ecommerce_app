import 'package:ecommerce_app/src/features/products/data/remote/products_data_source.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

class ProductsRepository {
  const ProductsRepository({required ProductsDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final ProductsDataSource _remoteDataSource;

  List<Product> fetchProducts() {
    return _remoteDataSource.fetchProducts();
  }
}
