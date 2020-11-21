//This file is just for testing purpose

import 'package:firebase_database/firebase_database.dart';

import 'package:main_app/data_models/seller.dart';
import 'data_models/product.dart';
import 'data.dart';

void run() {
  final DatabaseReference dBRef = FirebaseDatabase.instance.reference();
  void writeData() {
    dBRef.child('list').push().set({
      'id': 'id2',
      'data': 'Kuch data',
    });
  }

  void readData() {
    dBRef.child('Products').once().then((DataSnapshot snapshot) {
      Map data = snapshot.value;
      print(data);
      data.forEach((key, value) {
        print(value);
      });
    });
  }

  void someFunction() {
    List<Seller> sellerList = [
      Seller(name: 'name1', contact: 1),
      Seller(name: 'name2', contact: 2),
    ];

    print(sellerList[0]);
  }

  print(data.productList[0].name);
  // readData();
}
