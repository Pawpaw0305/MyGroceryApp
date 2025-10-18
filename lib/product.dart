class Product {
  final String id;
  final String name;
  final String vendor;
  final double price;
  final String imageUrl; // New field for product image

  Product({
    required this.id,
    required this.name,
    required this.vendor,
    required this.price,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'Product(id: $id, name: $name, vendor: $vendor, price: $price, imageUrl: $imageUrl)';
  }
}