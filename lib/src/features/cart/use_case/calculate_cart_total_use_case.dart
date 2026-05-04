import 'package:ecommerce_app/src/features/cart/domain/cart.dart';
import 'package:ecommerce_app/src/features/products/data/products_repository.dart';

class CalculateCartTotalUseCase {
  const CalculateCartTotalUseCase({required ProductsRepository repository})
    : _repository = repository;

  final ProductsRepository _repository;

  Future<int> execute(Cart cart) async {
    var total = 0;
    for (final item in cart.items) {
      final product = await _repository.fetchProductById(item.productId);
      total += product.price * item.quantity;
    }
    return total;
  }
}
