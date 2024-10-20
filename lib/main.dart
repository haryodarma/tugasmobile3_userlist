import 'package:c2_haryo_191_userlist/pages/home-page.dart';
import 'package:c2_haryo_191_userlist/pages/login-page.dart';
import 'package:c2_haryo_191_userlist/pages/register-page.dart';
import 'package:c2_haryo_191_userlist/pages/update-page.dart';
import 'package:c2_haryo_191_userlist/pages/welcome-page.dart';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      initialRoute: "/",
      routes: {
        "/": (context) => WelcomePage(),
        "/login": (context) => LoginPage(),
        "/register": (context) => RegisterPage(),
        "/home": (context) => HomePage(),
        "/update": (context) => UpdatePage(),
      },
    );
  }
}
