import 'dart:ui';

import 'package:flutter/material.dart';

@immutable
class AppSpacing extends ThemeExtension<AppSpacing> {
  const AppSpacing({
    required this.p4,
    required this.p8,
    required this.p12,
    required this.p16,
    required this.p20,
    required this.p24,
    required this.p32,
    required this.p48,
    required this.p64,
  });

  final double p4;
  final double p8;
  final double p12;
  final double p16;
  final double p20;
  final double p24;
  final double p32;
  final double p48;
  final double p64;

  static const standard = AppSpacing(
    p4: 4,
    p8: 8,
    p12: 12,
    p16: 16,
    p20: 20,
    p24: 24,
    p32: 32,
    p48: 48,
    p64: 64,
  );

  @override
  AppSpacing copyWith({
    double? p4,
    double? p8,
    double? p12,
    double? p16,
    double? p20,
    double? p24,
    double? p32,
    double? p48,
    double? p64,
  }) {
    return AppSpacing(
      p4: p4 ?? this.p4,
      p8: p8 ?? this.p8,
      p12: p12 ?? this.p12,
      p16: p16 ?? this.p16,
      p20: p20 ?? this.p20,
      p24: p24 ?? this.p24,
      p32: p32 ?? this.p32,
      p48: p48 ?? this.p48,
      p64: p64 ?? this.p64,
    );
  }

  @override
  AppSpacing lerp(AppSpacing? other, double t) {
    if (other is! AppSpacing) {
      return this;
    }

    return AppSpacing(
      p4: lerpDouble(p4, other.p4, t)!,
      p8: lerpDouble(p8, other.p8, t)!,
      p12: lerpDouble(p12, other.p12, t)!,
      p16: lerpDouble(p16, other.p16, t)!,
      p20: lerpDouble(p20, other.p20, t)!,
      p24: lerpDouble(p24, other.p24, t)!,
      p32: lerpDouble(p32, other.p32, t)!,
      p48: lerpDouble(p48, other.p48, t)!,
      p64: lerpDouble(p64, other.p64, t)!,
    );
  }
}
