import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: '商品を検索',
        prefixIcon: const Icon(Icons.search),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFD7D0DA)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF9E7BB5)),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: spacing.p12),
      ),
    );
  }
}
