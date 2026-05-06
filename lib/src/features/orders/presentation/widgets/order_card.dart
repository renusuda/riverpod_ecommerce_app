import 'package:ecommerce_app/src/extensions/int_extensions.dart';
import 'package:ecommerce_app/src/features/orders/domain/order.dart';
import 'package:ecommerce_app/src/features/orders/presentation/widgets/order_item_row.dart';

import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({super.key, required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Container(
        foregroundDecoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _OrderCardHeader(order: order),
            const Divider(height: 1, thickness: 1, color: Colors.grey),
            Padding(
              padding: EdgeInsets.all(spacing.p24),
              child: _OrderStatus(orderStatus: order.orderStatus),
            ),
            Padding(
              padding: EdgeInsets.all(spacing.p24),
              child: Column(
                children: [
                  for (final item in order.items.entries) ...[
                    OrderItemRow(productId: item.key, quantity: item.value),
                    if (item.key != order.items.keys.last)
                      SizedBox(height: spacing.p32),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderStatus extends StatelessWidget {
  const _OrderStatus({required this.orderStatus});

  final OrderStatus orderStatus;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final label = switch (orderStatus) {
      OrderStatus.confirmed => '確認済み - 配送準備中',
      OrderStatus.shipped => '発送済み - 配送中',
      OrderStatus.delivered => '配達完了',
    };

    return Text(
      label,
      style: textTheme.titleMedium?.copyWith(color: const Color(0xFF2B282D)),
    );
  }
}

class _OrderCardHeader extends StatelessWidget {
  const _OrderCardHeader({required this.order});

  final Order order;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return ColoredBox(
      color: const Color(0xFFF1F1F1),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: spacing.p24,
          vertical: spacing.p16,
        ),
        child: Row(
          children: [
            Expanded(
              child: _HeaderColumn(
                label: '注文日',
                value: DateFormat('yyyy年M月d日').format(order.orderDate),
              ),
            ),
            _HeaderColumn(
              label: '合計',
              value: '¥${order.total.round().commaSeparated}',
              crossAxisAlignment: CrossAxisAlignment.end,
            ),
          ],
        ),
      ),
    );
  }
}

class _HeaderColumn extends StatelessWidget {
  const _HeaderColumn({
    required this.label,
    required this.value,
    this.crossAxisAlignment = CrossAxisAlignment.start,
  });

  final String label;
  final String value;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: textTheme.titleMedium?.copyWith(
            color: const Color(0xFF2B282D),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          value,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w400,
            color: const Color(0xFF2B282D),
          ),
        ),
      ],
    );
  }
}
