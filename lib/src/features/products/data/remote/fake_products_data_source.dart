import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/data/remote/products_data_source.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

class FakeProductsDataSource implements ProductsDataSource {
  @override
  Future<List<Product>> fetchProducts() async {
    return kTestProducts;
  }
}
