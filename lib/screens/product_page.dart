import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:main_app/components/search_bar.dart';
import 'package:main_app/data_models/product.dart';
import 'package:main_app/data_models/seller.dart';
import 'package:main_app/constants.dart';

class ProductPage extends StatelessWidget {
  final Product product;
  final bool showAppBar;

  const ProductPage({this.product, this.showAppBar});

  @override
  Widget build(BuildContext context) {
    Seller seller = product.getSeller();

    return Scaffold(
      appBar: showAppBar
          ? AppBar(
              title: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text('Raste ka Maal Saste me',
                    style: GoogleFonts.openSans(textStyle: kTopAppBarTextStyle)),
              ),
              actions: <Widget>[
                IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      showSearch(context: context, delegate: SearchBar());
                    })
              ],
            )
          : null,
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Image(
              height: 250.0,
              fit: BoxFit.contain,
              // image: NetworkImage(product.networkImageAddress), TODO
              image: AssetImage('assets/images/Pseudocode.png'),
            ),
            Container(
              height: 100.0,
              color: kColorGreen,
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 260.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            product.name,
                            // 'ProductName',
                            style: TextStyle(fontSize: 35.0),
                          ),
                        ),
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Text(
                            // product.category, TODO
                            'ProductCategory',
                            style: TextStyle(fontSize: 19.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 5.0),
                  Icon(
                    FontAwesomeIcons.rupeeSign,
                    size: 25,
                  ),
                  Expanded(
                    child: Container(
                      constraints: BoxConstraints(maxHeight: 30.0),
                      child: FittedBox(
                        alignment: Alignment.centerLeft,
                        fit: BoxFit.contain,
                        child: Text(
                          product.price.toString(),
                          // 'Price',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 120.0,
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Expanded(
                    child: SizedBox(
                      child: AutoSizeText(
                        product.description,
                        // 'Description',
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 250.0,
              color: kColorGreen,
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  // TODO : Fetch Seller info based on sellerId in product
                  Text(
                    'Seller Info',
                    style: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(seller.name, style: TextStyle(fontSize: 20.0)),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Contact',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(seller.contact.toString(),
                          style: TextStyle(fontSize: 20.0)),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Shop Name',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(seller.shopName, style: TextStyle(fontSize: 20.0)),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    'Shop Address',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Expanded(
                    child: SizedBox(
                      child: AutoSizeText(
                        seller.shopAddress,
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
