import 'package:ecommerce_app/src/domain/product.dart';

abstract interface class ProductsDataSource {
  List<Product> fetchProducts();
}
