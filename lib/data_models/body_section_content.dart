import 'package:firebase_database/firebase_database.dart';

import 'package:main_app/data_models/product.dart';

class BodySectionContent {
  final String sectionTitle;
  final List<Product> productList;

  const BodySectionContent(
    this.sectionTitle,
    this.productList,
  );

  void save() async {
    bool alreadyPresent = false;
    Map jsonData;

    DatabaseReference databaseReference =
        FirebaseDatabase().reference().child('BodySections');

    await databaseReference.once().then((DataSnapshot snapshot) async {
      jsonData = snapshot.value;
      if (jsonData != null) {
        jsonData.forEach((key, value) async {
          if (value['sectionTitle'] == this.sectionTitle) {
            alreadyPresent = true;
            databaseReference =
                databaseReference.child(key).child('productList').reference();

            for (Product product in productList) {
              await databaseReference.push().set({
                'id': product.id,
                'name': product.name,
                'category': product.category,
                'sellerId': product.sellerId,
                'description': product.description,
                'price': product.price,
                'networkImageAddress': product.networkImageAddress,
              });
            }
          }
        });
      }
    });

    jsonData = {};
    if (alreadyPresent == false) {
      for (int i = 0; i < productList.length; i++) {
        jsonData[i.toString()] = {
          'id': productList[i].id,
          'name': productList[i].name,
          'category': productList[i].category,
          'sellerId': productList[i].sellerId,
          'description': productList[i].description,
          'price': productList[i].price,
          'networkImageAddress': productList[i].networkImageAddress,
        };
      }

      await databaseReference.push().set({
        'sectionTitle': this.sectionTitle,
        'productList': jsonData,
      });
    }

    print('Body Section Saved');
  }
}
