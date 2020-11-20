import 'package:firebase_database/firebase_database.dart';

class Product {
  String id;
  String category = '';
  String name = '';
  String description = '';
  String sellerId;
  String networkImageAddress = '';
  int price;

  Product({
    this.id,
    this.name,
    this.category,
    this.sellerId,
    this.networkImageAddress,
    this.description,
    this.price,
  });

  save() {
    final DatabaseReference databaseReference =
        FirebaseDatabase().reference().child("Product");
    print('Product Saved');
    this.id = sellerId + name;
    databaseReference.push().set({
      'id': this.id,
      'name': this.name,
      'category': this.category,
      'sellerId': this.sellerId,
      'description': this.description,
      'price': this.price
    });
  }
}
