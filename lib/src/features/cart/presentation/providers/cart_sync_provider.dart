import 'package:ecommerce_app/src/features/cart/use_case/cart_sync_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_sync_provider.g.dart';

@Riverpod(keepAlive: true)
CartSyncUseCase cartSync(Ref ref) {
  return CartSyncUseCase(ref);
}
