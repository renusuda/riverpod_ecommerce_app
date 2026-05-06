import 'package:ecommerce_app/src/common_widgets/async_value_widget.dart';
import 'package:ecommerce_app/src/features/orders/presentation/providers/orders_provider.dart';
import 'package:ecommerce_app/src/features/orders/presentation/widgets/order_card.dart';
import 'package:ecommerce_app/src/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrdersPage extends ConsumerWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ordersAsyncValue = ref.watch(ordersProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFFCF6FE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: Colors.white,
        title: const Text('注文履歴'),
        centerTitle: true,
      ),
      body: SafeArea(
        top: false,
        child: AsyncValueWidget(
          asyncValue: ordersAsyncValue,
          data: (orders) => orders.isEmpty
              ? const Center(child: Text('注文履歴はありません'))
              : ListView.separated(
                  padding: EdgeInsets.all(context.spacing.p12),
                  itemBuilder: (context, index) =>
                      OrderCard(order: orders[index]),
                  separatorBuilder: (context, index) =>
                      SizedBox(height: context.spacing.p24),
                  itemCount: orders.length,
                ),
        ),
      ),
    );
  }
}
