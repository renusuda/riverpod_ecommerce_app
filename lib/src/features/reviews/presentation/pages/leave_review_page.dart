import 'package:ecommerce_app/src/extensions/async_value_ui.dart';
import 'package:ecommerce_app/src/features/authentication/data/authentication_repository_provider.dart';
import 'package:ecommerce_app/src/features/products/presentation/providers/product_detail_provider.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/providers/add_review_provider.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/widgets/leave_review_input.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/widgets/leave_review_rating_selector.dart';
import 'package:ecommerce_app/src/features/reviews/presentation/widgets/leave_review_submit_button.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LeaveReviewPage extends HookConsumerWidget {
  const LeaveReviewPage({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spacing = context.spacing;
    final textTheme = Theme.of(context).textTheme;

    final productAsync = ref.watch(productDetailProvider(productId));
    final currentUserId = ref
        .watch(authenticationRepositoryProvider)
        .currentUser
        ?.uid;
    final existingReview = productAsync.asData?.value.reviews
        .where((r) => r.reviewerId == currentUserId)
        .firstOrNull;

    final isInitialized = useRef(false);
    final rating = useState<double>(0);
    final commentController = useTextEditingController();
    final addReviewState = ref.watch(addReviewProvider);

    useEffect(() {
      if (!isInitialized.value && existingReview != null) {
        rating.value = existingReview.rating;
        commentController.text = existingReview.comment;
        isInitialized.value = true;
      }
      return null;
    }, [existingReview]);

    ref.listen(addReviewProvider, (previous, next) {
      if (previous?.isLoading != true) return;

      if (next.hasError) {
        next.showAlertDialogOnError(context);
        return;
      }

      if (!next.isLoading) {
        Navigator.of(context).pop();
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFFFCF6FE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Text('レビューを書く'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(spacing.p16),
          child: Column(
            children: [
              if (existingReview != null) ...[
                Text(
                  '以前にレビューを投稿しました。送信すると更新されます。',
                  style: textTheme.bodyMedium,
                ),
                SizedBox(height: spacing.p16),
              ],
              LeaveReviewRatingSelector(
                rating: rating.value,
                onChanged: (value) => rating.value = value,
              ),
              SizedBox(height: spacing.p32),
              LeaveReviewInput(controller: commentController),
              SizedBox(height: spacing.p32),
              LeaveReviewSubmitButton(
                disabled: rating.value == 0,
                isLoading: addReviewState.isLoading,
                onPressed: addReviewState.isLoading
                    ? null
                    : () => ref
                          .read(addReviewProvider.notifier)
                          .execute(
                            productId,
                            rating.value,
                            commentController.text,
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
