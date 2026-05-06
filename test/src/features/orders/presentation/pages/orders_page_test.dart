import 'package:ecommerce_app/src/features/orders/data/orders_repository_provider.dart';
import 'package:ecommerce_app/src/features/orders/data/remote/orders_remote_data_source.dart';
import 'package:ecommerce_app/src/features/orders/domain/order.dart';
import 'package:ecommerce_app/src/features/orders/presentation/pages/orders_page.dart';
import 'package:ecommerce_app/src/theme/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('ダミー注文履歴が表示される', (tester) async {
    await tester.pumpWidget(const _OrdersTestApp());
    await tester.pumpAndSettle();

    expect(find.text('注文履歴'), findsOneWidget);
    expect(find.text('確認済み - 配送準備中'), findsNWidgets(2));
    expect(find.text('パスタプレート'), findsOneWidget);
    expect(find.text('ブルスケッタプレート'), findsOneWidget);
    expect(find.text('モッツァレラプレート'), findsOneWidget);
    expect(find.text('数量: 1'), findsNWidgets(2));
    expect(find.text('数量: 2'), findsOneWidget);
    expect(find.text('¥2,800'), findsOneWidget);
    expect(find.text('¥6,900'), findsOneWidget);
  });

  testWidgets('注文履歴が空の場合は空状態が表示される', (tester) async {
    await tester.pumpWidget(const _OrdersTestApp(orders: []));
    await tester.pumpAndSettle();

    expect(find.text('注文履歴'), findsOneWidget);
    expect(find.text('注文履歴はありません'), findsOneWidget);
    expect(find.text('確認済み - 配送準備中'), findsNothing);
  });
}

class _OrdersTestApp extends StatelessWidget {
  const _OrdersTestApp({this.orders});

  final List<Order>? orders;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        if (orders != null)
          ordersRemoteDataSourceProvider.overrideWithValue(
            _OrdersRemoteDataSourceStub(orders!),
          ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          extensions: const [AppSpacing.standard],
        ),
        home: const OrdersPage(),
      ),
    );
  }
}

class _OrdersRemoteDataSourceStub implements OrdersRemoteDataSource {
  const _OrdersRemoteDataSourceStub(this.orders);

  final List<Order> orders;

  @override
  Future<List<Order>> fetchOrders() async {
    return orders;
  }
}
