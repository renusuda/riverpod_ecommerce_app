import 'package:ecommerce_app/src/features/reviews/data/remote/fake_reviews_remote_data_source.dart';
import 'package:ecommerce_app/src/features/reviews/data/remote/reviews_remote_data_source.dart';
import 'package:ecommerce_app/src/features/reviews/data/reviews_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reviews_repository_provider.g.dart';

@Riverpod(keepAlive: true)
ReviewsRemoteDataSource reviewsRemoteDataSource(Ref ref) {
  return FakeReviewsRemoteDataSource();
}

@Riverpod(keepAlive: true)
ReviewsRepository reviewsRepository(Ref ref) {
  final remoteDataSource = ref.watch(reviewsRemoteDataSourceProvider);
  return ReviewsRepository(remoteDataSource: remoteDataSource);
}
