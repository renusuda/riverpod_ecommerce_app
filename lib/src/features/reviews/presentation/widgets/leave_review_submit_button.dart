import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LeaveReviewSubmitButton extends StatelessWidget {
  const LeaveReviewSubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    return Container(
      height: 56,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xFFE0DAE2),
        borderRadius: BorderRadius.circular(28),
      ),
      margin: EdgeInsets.symmetric(horizontal: spacing.p4),
      child: Text(
        '送信',
        style: textTheme.headlineSmall?.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
