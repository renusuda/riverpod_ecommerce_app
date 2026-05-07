import 'package:ecommerce_app/src/features/reviews/presentation/widgets/leave_review_input.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/widgets/leave_review_rating_selector.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/widgets/leave_review_submit_button.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class LeaveReviewPage extends StatelessWidget {
  const LeaveReviewPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return Scaffold(
      backgroundColor: const Color(0xFFFCF6FE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('レビューを書く'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(spacing.p16),
          child: Column(
            children: [
              const LeaveReviewRatingSelector(),
              SizedBox(height: spacing.p32),
              const LeaveReviewInput(),
              SizedBox(height: spacing.p32),
              const LeaveReviewSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }
}
