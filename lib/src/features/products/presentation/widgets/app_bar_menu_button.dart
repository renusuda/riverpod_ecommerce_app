import 'package:ecommerce_app/src/routing/app_route.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBarMenuButton extends StatelessWidget {
  const AppBarMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        if (value == 'signIn') {
          context.goNamed(AppRoute.signIn.name);
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(value: 'signIn', child: Text('ログイン')),
      ],
    );
  }
}
