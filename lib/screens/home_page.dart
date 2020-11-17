import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:main_app/constants.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('RasteKaMaalSasteMe', style: kAppBarTextStyle),
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
        bottomNavigationBar: BottomAppBar(
          color: colorBlue,
          child: TabBar(
            indicatorColor: colorBlack,
            labelPadding: EdgeInsets.zero,
            indicatorWeight: 5.0,
            labelStyle: kAppBarTextStyle,
            tabs: [
              Tab(
                  icon: Icon(Icons.shopping_cart),
                  text: 'BUY',
                  iconMargin: EdgeInsets.only(bottom: 5.0)),
              Tab(
                  icon: Icon(Icons.store),
                  text: ('SELL'),
                  iconMargin: EdgeInsets.only(bottom: 5.0)),
              Tab(
                  icon: Icon(Icons.account_circle),
                  text: ('YOU'),
                  iconMargin: EdgeInsets.only(bottom: 5.0)),
            ],
          ),
          // child: Text('Tabs Demo'),
        ),
        body: TabBarView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 100.0,
                  decoration: BoxDecoration(color: colorGreen),
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: colorWhite),
                  ),
                ),
              ],
            ), // TODO: Add Scrollable categories widget and scrollable products widget by Vishwas
            Icon(Icons.directions_transit), //TODO : Create Sell Page by Gautam
            Icon(Icons.directions_bike), //TODO : Create You Page
          ],
        ),
      ),
    );
  }
}
