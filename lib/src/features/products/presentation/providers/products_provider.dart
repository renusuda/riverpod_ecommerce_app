import 'dart:async';

import 'package:ecommerce_app/src/features/products/data/products_repository_provider.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@riverpod
Future<List<Product>> products(Ref ref, String searchText) async {
  final repository = ref.watch(productsRepositoryProvider);
  if (searchText.isEmpty) return repository.fetchProducts();

  await Future<void>.delayed(const Duration(milliseconds: 250));

  return repository.searchProducts(searchText);
}

@riverpod
Future<Product> product(Ref ref, String id) async {
  final repository = ref.watch(productsRepositoryProvider);
  return repository.fetchProductById(id);
}
