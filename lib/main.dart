import 'package:flutter/material.dart';

import 'screens/home_page.dart';
import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: kColorBlue,
        scaffoldBackgroundColor: kColorWhite,
        accentColor: kColorBlack,
      ),
      initialRoute: '/HomePage',
      routes: {
        '/HomePage': (context) => HomePage(),
      },
    );
  }
}
