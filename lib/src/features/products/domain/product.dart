class Product {
  const Product({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.stockQuantity,
  });

  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final int stockQuantity;
}
