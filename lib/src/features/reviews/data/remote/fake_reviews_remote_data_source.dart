import 'package:ecommerce_app/src/constants/test_products.dart';
import 'package:ecommerce_app/src/features/reviews/data/remote/reviews_remote_data_source.dart';
import 'package:ecommerce_app/src/features/reviews/domain/review.dart';

class FakeReviewsRemoteDataSource implements ReviewsRemoteDataSource {
  @override
  Future<void> addReview(String productId, Review review) async {
    final index = kTestProducts.indexWhere((p) => p.id == productId);
    if (index == -1) return;
    final product = kTestProducts[index];
    kTestProducts[index] = product.copyWith(
      reviews: [review, ...product.reviews],
    );
  }
}
