import 'package:flutter/material.dart';
import 'package:flutter_udemy/screens/loginpage.dart';
import 'package:flutter_udemy/screens/mainpage.dart';
import 'package:flutter_udemy/screens/registrationpage.dart';
import './screens/loginpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
          fontFamily: 'Brand-Regular', primaryColor: Colors.deepPurpleAccent),
      home: RegistrationPage(),
      initialRoute: LoginPage.routeName,
      routes: {
        MainPage.routeName: (context) => MainPage(),
        LoginPage.routeName: (context) => LoginPage(),
        RegistrationPage.routeName: (context) => RegistrationPage(),
      },
    );
  }
}

//AIzaSyCnujjx1aRtLg6vlOWWKX16NfvWWEO5bnY
