import 'package:ecommerce_app/src/features/products/domain/product.dart';

abstract interface class ProductsDataSource {
  List<Product> fetchProducts();
}
