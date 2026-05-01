import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/domain/product.dart';

class ProductsRepository {
  List<Product> fetchProducts() {
    return kTestProducts;
  }
}
