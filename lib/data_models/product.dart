import 'package:firebase_database/firebase_database.dart';

class Product {
  int id;
  String category = '';
  String name = '';
  String description = '';
  int sellerId;
  String networkImageAddress = "";
  int price;
  static int count=0;



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
    count++;
    this.id = count;
    print('Product Saved');
    final DatabaseReference databaseReference = FirebaseDatabase().reference().child("Product");
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
