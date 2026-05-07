import 'package:ecommerce_app/src/features/reviews/domain/review.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
sealed class Product with _$Product {
  const Product._();

  const factory Product({
    required String id,
    required String name,
    required String description,
    required String imageUrl,
    required int price,
    required int stockQuantity,
    @Default([]) List<Review> reviews,
  }) = _Product;

  int get reviewCount => reviews.length;

  double get averageRating {
    if (reviews.isEmpty) {
      return 0;
    }

    final ratingTotal = reviews
        .map((review) => review.rating)
        .reduce((total, rating) => total + rating);
    return ratingTotal / reviews.length;
  }
}
