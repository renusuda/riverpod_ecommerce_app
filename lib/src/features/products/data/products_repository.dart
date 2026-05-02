import 'package:ecommerce_app/src/features/products/data/remote/products_data_source.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

class ProductsRepository {
  const ProductsRepository({required ProductsDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final ProductsDataSource _remoteDataSource;

  Future<List<Product>> fetchProducts() {
    return _remoteDataSource.fetchProducts();
  }

  Future<List<Product>> searchProducts(String searchText) {
    return _remoteDataSource.searchProducts(searchText);
  }

  Future<Product> fetchProductById(String id) {
    return _remoteDataSource.fetchProductById(id);
  }
}
