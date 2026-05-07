import 'package:ecommerce_app/src/features/reviews/domain/review.dart';

abstract interface class ReviewsRemoteDataSource {
  Future<void> addReview(String productId, Review review);
}
