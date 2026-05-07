import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LeaveReviewInput extends StatelessWidget {
  const LeaveReviewInput({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: 170,
      child: TextField(
        maxLines: null,
        expands: true,
        textAlignVertical: TextAlignVertical.center,
        style: textTheme.headlineSmall?.copyWith(
          color: const Color(0xFF59535F),
          fontWeight: FontWeight.w400,
        ),
        decoration: InputDecoration(
          hintText: 'レビュー（任意）',
          hintStyle: textTheme.headlineSmall?.copyWith(
            color: const Color(0xFF59535F),
            fontWeight: FontWeight.w400,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: spacing.p24),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF85808A), width: 1.4),
            borderRadius: BorderRadius.circular(6),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF85808A), width: 1.4),
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ),
    );
  }
}
