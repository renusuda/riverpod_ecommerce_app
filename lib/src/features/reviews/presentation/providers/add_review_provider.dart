import 'package:ecommerce_app/src/features/authentication/data/authentication_repository_provider.dart';
import 'package:ecommerce_app/src/features/products/presentation/providers/product_detail_provider.dart';
import 'package:ecommerce_app/src/features/reviews/domain/review.dart';
import 'package:ecommerce_app/src/features/reviews/use_case/add_review_use_case_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_review_provider.g.dart';

@riverpod
class AddReview extends _$AddReview {
  @override
  FutureOr<void> build() {}

  Future<void> execute(String productId, double rating, String comment) async {
    final user = ref.read(authenticationRepositoryProvider).currentUser;
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final review = Review(
        reviewerId: user?.uid ?? '',
        rating: rating,
        comment: comment,
        createdAt: DateTime.now(),
      );
      await ref.read(addReviewUseCaseProvider).execute(productId, review);
      ref.invalidate(productDetailProvider(productId));
    });
  }
}
