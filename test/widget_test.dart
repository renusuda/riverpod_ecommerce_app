import 'package:ecommerce_app/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('shows products from test data', (tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Bruschetta plate'), findsOneWidget);
    expect(find.text('\$15.00'), findsOneWidget);
    expect(find.text('Quantity: 5'), findsWidgets);
  });
}
