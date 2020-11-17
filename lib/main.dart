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
        primaryColor: colorBlue,
        scaffoldBackgroundColor: Color(0xFFEFFFFB),
        accentColor: Color(0xFF4F98CA),
      ),
      initialRoute: '/HomePage',
      routes: {
        '/HomePage': (context) => HomePage(),
      },
    );
  }
}
