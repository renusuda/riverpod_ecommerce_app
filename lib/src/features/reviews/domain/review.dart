import 'package:freezed_annotation/freezed_annotation.dart';

part 'review.freezed.dart';

@freezed
sealed class Review with _$Review {
  const factory Review({
    required String reviewerId,
    required double rating,
    required String comment,
    required DateTime createdAt,
  }) = _Review;
}
