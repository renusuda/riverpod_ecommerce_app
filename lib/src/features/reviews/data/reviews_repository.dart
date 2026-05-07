import 'package:ecommerce_app/src/features/reviews/data/remote/reviews_remote_data_source.dart';
import 'package:ecommerce_app/src/features/reviews/domain/review.dart';

class ReviewsRepository {
  const ReviewsRepository({required ReviewsRemoteDataSource remoteDataSource})
    : _remoteDataSource = remoteDataSource;

  final ReviewsRemoteDataSource _remoteDataSource;

  Future<void> addReview(String productId, Review review) {
    return _remoteDataSource.addReview(productId, review);
  }
}
