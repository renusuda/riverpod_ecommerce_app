import 'package:ecommerce_app/src/features/authentication/data/authentication_repository_provider.dart';
import 'package:ecommerce_app/src/features/authentication/domain/app_user.dart';
import 'package:ecommerce_app/src/features/cart/data/cart_repository_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class CartSyncUseCase {
  CartSyncUseCase(this.ref) {
    _init();
  }

  final Ref ref;

  void _init() {
    ref.listen<AsyncValue<AppUser?>>(authenticationStateChangesProvider, (
      previous,
      next,
    ) {
      final previousUser = previous?.value;
      final user = next.value;
      if (previousUser == null && user != null) {
        _migrateLocalCartToRemote(user.uid);
      }
    });
  }

  Future<void> _migrateLocalCartToRemote(String userId) async {
    try {
      await ref.read(cartRepositoryProvider).migrateLocalCartToRemote(userId);
    } catch (error) {
      debugPrint('カートのマイグレーションに失敗しました: $error');
    }
  }
}
