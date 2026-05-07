import 'package:ecommerce_app/src/features/reviews/data/reviews_repository_provider.dart';
import 'package:ecommerce_app/src/features/reviews/use_case/add_review_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_review_use_case_provider.g.dart';

@riverpod
AddReviewUseCase addReviewUseCase(Ref ref) {
  return AddReviewUseCase(repository: ref.watch(reviewsRepositoryProvider));
}
