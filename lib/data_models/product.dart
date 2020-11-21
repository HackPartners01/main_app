import 'package:firebase_database/firebase_database.dart';

import 'seller.dart';
import 'package:main_app/data.dart';

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

  void save() async {
    final DatabaseReference databaseReference =
        FirebaseDatabase().reference().child('Products');
    this.id = sellerId + name;
    await databaseReference.push().set({
      'id': this.id,
      'name': this.name,
      'category': this.category,
      'sellerId': this.sellerId,
      'description': this.description,
      'price': this.price
    });

    print('Product Saved');
  }

  Seller getSeller() {
    for (Seller seller in data.sellerList) {
      if (sellerId == seller.id) return seller;
    }
    return null;
  }
}
