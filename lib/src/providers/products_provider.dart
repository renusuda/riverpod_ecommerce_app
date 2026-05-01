import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@riverpod
List<Product> products(Ref ref) {
  return kTestProducts;
}
