import 'package:ecommerce_app/src/features/authentication/data/authentication_repository_provider.dart';
import 'package:ecommerce_app/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarMenuButton extends ConsumerWidget {
  const AppBarMenuButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authenticationStateChangesProvider).value;

    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        if (value == 'signIn') {
          context.goNamed(AppRoute.signIn.name);
        } else if (value == 'orders') {
          context.goNamed(AppRoute.orders.name);
        } else if (value == 'account') {
          context.goNamed(AppRoute.account.name);
        }
      },
      itemBuilder: (context) => [
        if (user == null)
          const PopupMenuItem(value: 'signIn', child: Text('ログイン')),
        if (user != null) ...[
          const PopupMenuItem(value: 'orders', child: Text('注文履歴')),
          const PopupMenuItem(value: 'account', child: Text('アカウント')),
        ],
      ],
    );
  }
}
