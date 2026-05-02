import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/products/data/remote/products_data_source.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

class FakeProductsDataSource implements ProductsDataSource {
  @override
  Future<List<Product>> fetchProducts() async {
    return kTestProducts;
  }

  @override
  Future<List<Product>> searchProducts(String searchText) async {
    return kTestProducts.where((p) => p.name.contains(searchText)).toList();
  }

  @override
  Future<Product> fetchProductById(String id) async {
    return kTestProducts.firstWhere(
      (p) => p.id == id,
      orElse: () => throw StateError('商品が見つかりません: $id'),
    );
  }
}
