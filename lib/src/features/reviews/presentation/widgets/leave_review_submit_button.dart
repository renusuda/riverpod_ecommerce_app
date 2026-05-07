import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LeaveReviewSubmitButton extends StatelessWidget {
  const LeaveReviewSubmitButton({
    super.key,
    required this.onPressed,
    required this.disabled,
    this.isLoading = false,
  });

  final VoidCallback? onPressed;
  final bool disabled;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
      label: '送信',
      disabled: disabled,
      isLoading: isLoading,
      onPressed: onPressed,
    );
  }
}
