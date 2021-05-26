class Product {
  final id;
  final String name;
  final double price;
  final int quantity;

  Product({
    id,
    required this.name,
    required this.price,
    required this.quantity,
  }) : id = id;
}
