import 'package:ecommerce_app/src/extensions/int_extensions.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('IntExtensions.commaSeparated', () {
    test('0 はそのまま返す', () {
      expect(0.commaSeparated, '0');
    });

    test('3桁以下はカンマなし', () {
      expect(880.commaSeparated, '880');
    });

    test('ちょうど4桁でカンマが入る', () {
      expect(1000.commaSeparated, '1,000');
    });

    test('4桁の整数にカンマが入る', () {
      expect(2500.commaSeparated, '2,500');
    });

    test('7桁の整数に複数のカンマが入る', () {
      expect(1000000.commaSeparated, '1,000,000');
    });
  });
}
