import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/data/remote/products_data_source.dart';
import 'package:ecommerce_app/src/domain/product.dart';

class FakeProductsDataSource implements ProductsDataSource {
  @override
  List<Product> fetchProducts() {
    return kTestProducts;
  }
}
