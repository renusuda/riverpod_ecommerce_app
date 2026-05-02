import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class AppCard extends StatelessWidget {
  const AppCard({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Card(
      color: const Color(0xFFFBF6FE),
      elevation: 1,
      shadowColor: const Color(0x26000000),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(color: Color(0xFFF0EAF3)),
      ),
      child: Padding(padding: EdgeInsets.all(spacing.p24), child: child),
    );
  }
}
