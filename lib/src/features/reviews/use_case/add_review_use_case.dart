import 'package:ecommerce_app/src/features/reviews/data/reviews_repository.dart';
import 'package:ecommerce_app/src/features/reviews/domain/review.dart';

class AddReviewUseCase {
  const AddReviewUseCase({required ReviewsRepository repository})
    : _repository = repository;

  final ReviewsRepository _repository;

  Future<void> execute(String productId, Review review) {
    return _repository.addReview(productId, review);
  }
}
