import 'package:flutter/material.dart';

import 'package:main_app/data_models/product.dart';
import 'package:main_app/constants.dart';
import 'reusable_card.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final Color backgroundColor;
  final Function onPress;

  const ProductCard({
    this.product,
    this.backgroundColor = kColorWhite,
    this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: kColorWhite,
      onPress: onPress,
    );
  }
}
