class Product {
  final int id; // (Product ID) Generated upon addition
  final String name;
  final String category;
  final int sellerId; // Will be used to fetch seller info
  final String networkImageAddress;
  final String description;
  final int price;

  const Product(
    this.id,
    this.name,
    this.category,
    this.sellerId,
    this.networkImageAddress,
    this.description,
    this.price,
  );
}
