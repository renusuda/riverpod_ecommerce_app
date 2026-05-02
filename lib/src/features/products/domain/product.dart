import 'package:freezed_annotation/freezed_annotation.dart';

part 'product.freezed.dart';

@freezed
sealed class Product with _$Product {
  const factory Product({
    required String id,
    required String name,
    required String imageUrl,
    required int price,
    required int stockQuantity,
    @Default(0) int reviewCount,
    @Default(0.0) double averageRating,
  }) = _Product;
}
