class Order {
  final String productId; // Changed from productid to productId for consistency
  final String productImage;
  final double price;
  final String productName;
  final String temperature;
  final String size;
  final String sugarLevel;
  int quantity;

  Order({
    required this.productId,
    required this.productImage,
    required this.price,
    required this.productName,
    required this.temperature,
    required this.size,
    required this.sugarLevel,
    this.quantity = 1,
  });
}
