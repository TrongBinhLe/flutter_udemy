import 'package:flutter/material.dart';
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
      initialRoute: RegistrationPage.routeName,
      routes: {
        MainPage.routeName: (context) => MainPage(),
        Loginpage.routeName: (context) => Loginpage(),
        RegistrationPage.routeName: (context) => RegistrationPage(),
      },
    );
  }
}
