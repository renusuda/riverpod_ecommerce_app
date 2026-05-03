import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:ecommerce_app/src/routing/app_route.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmptyCartView extends StatelessWidget {
  const EmptyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    return Center(
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
    );
  }
}
