
import 'package:flutter/material.dart';
import 'package:main_app/screens/sell_page_part2.dart';

class Seller {
  final String name = '';
  final int contact ;
  final int id;
  final String shopName = '';
  final String shopAddress = '';
  final double latitude;
  final double longitude;
  static int count=0;

  Seller(
      {this.name,
      this.contact,
      this.shopName,
      this.shopAddress,
      this.id,
      this.latitude,
      this.longitude}){
    count++;
    this.id = count;
  }

  save() {
    print('Seller Saved');
  }
}

