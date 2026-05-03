import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/routing/app_route.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('カート'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('カートは空です。', style: textTheme.titleLarge),
            SizedBox(height: spacing.p16),
            PrimaryButton(
              label: 'ホーム画面に戻る',
              onPressed: () => context.goNamed(AppRoute.home.name),
              expand: false,
            ),
          ],
        ),
      ),
    );
  }
}
