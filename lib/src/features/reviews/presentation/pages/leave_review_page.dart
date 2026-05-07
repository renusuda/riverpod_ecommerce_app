import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LeaveReviewPage extends StatelessWidget {
  const LeaveReviewPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('レビューを書く'),
      ),
      body: Padding(
        padding: EdgeInsets.all(spacing.p24),
        child: Text('商品ID: $productId', style: textTheme.bodyLarge),
      ),
    );
  }
}
