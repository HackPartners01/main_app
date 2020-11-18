import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:main_app/constants.dart';
import 'package:main_app/components/search_bar.dart';
import 'package:main_app/components/circle_image_and_label.dart';
import 'package:main_app/components/body_section.dart';
import 'package:main_app/screens/product_list.dart';
import 'sell_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Raste ka Maal Saste me',
              style: GoogleFonts.openSans(textStyle: kTopAppBarTextStyle)),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: SearchBar());
                })
          ],
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Text('Drawer Header'),
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                // Category Bar
                Container(
                  height: 100.0,
                  decoration: BoxDecoration(color: kColorGreen),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      CircleImageAndLabel(
                          image: AssetImage('assets/images/Pseudocode.png'),
                          label: 'Category1',
                          onPress: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => ProductList()));
                          },
                        ),
                        CircleImageAndLabel(
                          image: AssetImage('assets/images/Pseudocode.png'),
                          label: 'Category2',
                          onPress: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => ProductList()));
                          },
                        ),
                        CircleImageAndLabel(
                          image: AssetImage('assets/images/Pseudocode.png'),
                          label: 'Category3',
                          onPress: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => ProductList()));
                          },
                        ),
                        CircleImageAndLabel(
                          image: AssetImage('assets/images/Pseudocode.png'),
                          label: 'Category4',
                          onPress: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => ProductList()));
                          },
                        ),
                        CircleImageAndLabel(
                          image: AssetImage('assets/images/Pseudocode.png'),
                          label: 'Category5',
                          onPress: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => ProductList()));
                          },
                        ),
                    ],
                  ),
                ),
                // Body Sections
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: kColorBlack),
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        BodySection(
                          title: 'Deals of the Day',
                          numberOfCards: 4,
                          color: kColorBlue,
                        ),
                        BodySection(
                          title: 'Recommendations : Based on Your Search',
                          numberOfCards: 5,
                          color: kColorGreen,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ), // TODO: Add Categories and products to scrollable list
            SellPage(), //TODO : Create Sell Page by Gautam
            Icon(Icons.directions_bike), //TODO : Create You Page
          ],
        ),
        bottomNavigationBar: SizedBox(
          height: kBottomAppBarHeight,
          child: BottomAppBar(
            color: kColorBlue,
            child: TabBar(
              indicatorColor: kColorBlack,
              labelColor: kColorBlack,
              unselectedLabelColor: kColorWhite,
              labelPadding: EdgeInsets.zero,
              indicatorWeight: 5.0,
              labelStyle:
                  GoogleFonts.openSans(textStyle: kBottomAppBarTextStyle),
              tabs: [
                Tab(
                  icon: Icon(Icons.shopping_cart, size: kBottomAppBarIconSize),
                  text: 'BUY',
                  iconMargin: kBottomAppBarIconMargin,
                ),
                Tab(
                  icon: Icon(Icons.store, size: kBottomAppBarIconSize),
                  text: 'SELL',
                  iconMargin: kBottomAppBarIconMargin,
                ),
                Tab(
                  icon: Icon(Icons.account_circle, size: kBottomAppBarIconSize),
                  text: 'YOU',
                  iconMargin: kBottomAppBarIconMargin,
                ),
              ],
            ),
            // child: Text('Tabs Demo'),
          ),
        ),
      ),
    );
  }
}
