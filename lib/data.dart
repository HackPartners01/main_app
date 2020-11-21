import 'package:firebase_database/firebase_database.dart';

import 'package:main_app/data_models/product.dart';
import 'package:main_app/data_models/seller.dart';

class Data {
  List<Product> productList = [];
  List<Seller> sellerList = [];
  final DatabaseReference databaseReference = FirebaseDatabase.instance.reference();

  void updateProductList() {
    Map data;
    databaseReference.child('Products').onValue.listen((event) {
      print('product list updation event called');
      productList = [];
      data = event.snapshot.value;
      if (data != null) {
        data.forEach((key, value) {
          productList.add(
            Product(
              id: value['id'],
              name: value['name'],
              category: value['category'],
              sellerId: value['sellerId'],
              networkImageAddress: value['networkImageAddress'],
              description: value['description'],
              price: value['price'],
            ),
          );
        });
      }
      print('Product list updated');
    });
  }

  void updateSellerList() {
    var data;
    databaseReference.child('Sellers').onValue.listen((event) {
      print('seller list updation event called');
      sellerList = [];
      data = event.snapshot.value;
      if (data != null) {
        data.forEach((key, value) {
          sellerList.add(
            Seller(
              name: value['name'],
              contact: value['contact'],
              shopName: value['shopName'],
              shopAddress: value['shopAddress'],
              id: value['id'],
              latitude: value['latitude'],
              longitude: value['longitude'],
            ),
          );
        });
      }
      print('Seller list updated');
    });
  }
}

Data data = Data();
