
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:main_app/screens/sell_page_part2.dart';

class Seller {
  String name;
  int contact ;
  String id;
  String shopName;
  String shopAddress;
  double latitude;
  double longitude;
  int count=0;

  Seller(
      {this.name,
      this.contact,
      this.shopName,
      this.shopAddress,
      this.id,
      this.latitude,
      this.longitude});

  save() {
    this.id = name+contact.toString();
    print('Seller Saved');
    final DatabaseReference databaseReference = FirebaseDatabase().reference().child("Sellers");
    databaseReference.push().set({
      'id': this.id,
      'name': this.name,
      'contact': this.contact,
      'shopName': this.shopName,
      'shopAddress': this.shopAddress
    });
  }
}

