import 'package:flutter/material.dart';

class QuantityStepper extends StatelessWidget {
  const QuantityStepper({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
    required this.maxQuantity,
  });

  final int quantity;

  final VoidCallback onIncrement;

  final VoidCallback onDecrement;

  final int maxQuantity;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        border: Border.all(color: Colors.grey.shade400),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.remove),
            onPressed: quantity > 1 ? onDecrement : null,
          ),
          Text('$quantity', style: textTheme.bodyLarge),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: quantity >= maxQuantity ? null : onIncrement,
          ),
        ],
      ),
    );
  }
}
