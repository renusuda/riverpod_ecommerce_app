import 'package:ecommerce_app/src/features/products/data/products_repository.dart';
import 'package:ecommerce_app/src/features/products/domain/product.dart';

class FetchProductsUseCase {
  const FetchProductsUseCase({required ProductsRepository repository})
    : _repository = repository;

  final ProductsRepository _repository;

  Future<List<Product>> execute(String searchText) async {
    if (searchText.isEmpty) return _repository.fetchProducts();
    await Future<void>.delayed(const Duration(milliseconds: 250));
    return _repository.searchProducts(searchText);
  }
}
