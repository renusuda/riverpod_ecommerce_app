import 'package:ecommerce_app/src/common_widgets/primary_button.dart';
import 'package:flutter/material.dart';

class LeaveReviewSubmitButton extends StatelessWidget {
  const LeaveReviewSubmitButton({
    super.key,
    required this.onPressed,
    required this.disabled,
  });

  final VoidCallback? onPressed;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(label: '送信', disabled: disabled, onPressed: onPressed);
  }
}
