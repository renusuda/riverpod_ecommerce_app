import 'package:ecommerce_app/src/features/products/domain/product.dart';

abstract interface class ProductsDataSource {
  Future<List<Product>> fetchProducts();

  Future<List<Product>> searchProducts(String searchText);

  Future<Product> fetchProductById(String id);
}
