import 'dart:async';

import 'package:ecommerce_app/src/features/products/data/products_repository_provider.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_product_detail_provider.g.dart';

@riverpod
Future<Product> cartProductDetail(Ref ref, String id) async {
  final repository = ref.watch(productsRepositoryProvider);
  return repository.fetchProductById(id);
}
