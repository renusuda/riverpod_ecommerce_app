import 'package:ecommerce_app/src/common_widgets/error_message.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({
    super.key,
    required this.asyncValue,
    required this.data,
  });

  final AsyncValue<T> asyncValue;

  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return switch (asyncValue) {
      AsyncValue(:final value?) => data(value),
      AsyncValue(error: != null) => ErrorMessage(
        errorMessage: '${asyncValue.error}',
      ),
      AsyncValue() => const Center(child: CircularProgressIndicator()),
    };
  }
}
