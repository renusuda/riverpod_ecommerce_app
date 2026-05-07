import 'package:ecommerce_app/src/features/reviews/presentation/widgets/review_star_icon.dart';
import 'package:flutter/material.dart';

class LeaveReviewRatingSelector extends StatelessWidget {
  const LeaveReviewRatingSelector({
    super.key,
    required this.rating,
    required this.onChanged,
  });

  final double rating;
  final ValueChanged<double> onChanged;

  static const _touchSize = 48.0;
  static const _starSize = 40.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown: (details) {
              final isLeftHalf = details.localPosition.dx < _touchSize / 2;
              onChanged(index + (isLeftHalf ? 0.5 : 1.0));
            },
            child: SizedBox.square(
              dimension: _touchSize,
              child: Center(
                child: ReviewStarIcon(
                  fillRatio: (rating - index).clamp(0, 1).toDouble(),
                  size: _starSize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
