import 'package:firebase_database/firebase_database.dart';

String globalVariable = 'lund';

class Seller {
  String name;
  int contact;
  String id;
  String shopName;
  String shopAddress;
  double latitude;
  double longitude;

  Seller({
    this.name,
    this.contact,
    this.shopName,
    this.shopAddress,
    this.id,
    this.latitude,
    this.longitude,
  });

  void save() async {
    this.id = name + contact.toString();
    final DatabaseReference databaseReference =
        FirebaseDatabase().reference().child('Sellers');
    await databaseReference.push().set({
      'id': this.id,
      'name': this.name,
      'contact': this.contact,
      'shopName': this.shopName,
      'shopAddress': this.shopAddress,
    });

    print('Seller Saved');
  }
}
