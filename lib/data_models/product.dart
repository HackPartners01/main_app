import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'seller.dart';
import 'package:main_app/data.dart';

class Product {
  String id;
  String category = '';
  String name = '';
  String description = '';
  String sellerId;
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

  Seller getSeller() {
    for (Seller seller in data.sellerList) {
      if (sellerId == seller.id) return seller;
    }
    return null;
  }
  
  void save() async {
    final DatabaseReference databaseReference = FirebaseDatabase().reference().child("Products");
    print('Product Saved');
    this.id = sellerId+name;
    await databaseReference.push().set({
      'id': this.id,
      'name': this.name,
      'category': this.category,
      'sellerId': this.sellerId,
      'description': this.description,
      'price': this.price
    });

    


  }

}
