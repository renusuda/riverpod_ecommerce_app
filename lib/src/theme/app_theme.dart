import 'package:ecommerce_app/src/theme/app_spacing.dart';
import 'package:flutter/material.dart';

extension AppTheme on BuildContext {
  AppSpacing get spacing => Theme.of(this).extension<AppSpacing>()!;
}
