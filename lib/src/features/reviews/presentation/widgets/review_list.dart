import 'package:ecommerce_app/src/common_widgets/app_card.dart';
import 'package:ecommerce_app/src/features/reviews/domain/review.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/widgets/review_star_icon.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

class ReviewList extends StatelessWidget {
  const ReviewList({super.key, required this.reviews});

  final List<Review> reviews;

  @override
  Widget build(BuildContext context) {
    if (reviews.isEmpty) {
      return const SizedBox.shrink();
    }

    final spacing = context.spacing;

    return Column(
      children: [
        SizedBox(height: spacing.p16),
        for (final (index, review) in reviews.indexed) ...[
          _ReviewCard(review: review),
          if (index < reviews.length - 1) SizedBox(height: spacing.p12),
        ],
      ],
    );
  }
}

class _ReviewCard extends StatelessWidget {
  const _ReviewCard({required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;
    final dateText = _formatJapaneseDate(review.createdAt);

    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _ReviewStars(rating: review.rating),
              const Spacer(),
              Text(dateText, style: textTheme.bodyMedium),
            ],
          ),
          SizedBox(height: spacing.p16),
          Text(review.comment, style: textTheme.bodyLarge),
        ],
      ),
    );
  }
}

String _formatJapaneseDate(DateTime date) {
  const weekdays = ['月', '火', '水', '木', '金', '土', '日'];
  final weekday = weekdays[date.weekday - 1];
  return '${date.year}年${date.month}月${date.day}日（$weekday）';
}

class _ReviewStars extends StatelessWidget {
  const _ReviewStars({required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (index) =>
            ReviewStarIcon(fillRatio: (rating - index).clamp(0, 1).toDouble()),
      ),
    );
  }
}
