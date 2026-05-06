import 'package:ecommerce_app/src/features/cart/presentation/providers/cart_sync_provider.dart';
import 'package:ecommerce_app/src/routing/app_router.dart';
import 'package:ecommerce_app/src/theme/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ログイン状態の変化を監視し、ログイン時にローカルカートをリモートへ移行する。
    ref.watch(cartSyncProvider);

    final goRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: goRouter,
      debugShowCheckedModeBanner: false,
      title: 'Eコマースアプリ',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        extensions: const [AppSpacing.standard],
      ),
    );
  }
}
