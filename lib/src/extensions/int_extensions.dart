import 'package:intl/intl.dart';

extension IntExtensions on int {
  String get commaSeparated {
    final formatter = NumberFormat('#,###');
    return formatter.format(this);
  }
}
