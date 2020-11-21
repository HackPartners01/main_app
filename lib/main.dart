import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main_app/screens/product_page.dart';

import 'screens/home_page.dart';
import 'screens/product_list.dart';
import 'constants.dart';
import 'data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    data.updateProductList();
    data.updateSellerList();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: kColorBlue,
        scaffoldBackgroundColor: kColorWhite,
        accentColor: kColorBlack,
      ),
      initialRoute: '/HomePage',
      routes: {
        '/HomePage': (context) => HomePage(),
        '/ProductList': (context) => ProductList(),
        '/ProductPage': (context) => ProductPage(),
      },
    );
  }
}
