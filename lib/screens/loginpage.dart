import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:flutter_udemy/brand_colors.dart';
import 'package:flutter_udemy/screens/registrationpage.dart';

class Loginpage extends StatelessWidget {
  static const String routeName = '\login_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 70,
                ),
                Image(
                  alignment: Alignment.center,
                  height: 100.0,
                  width: 100.0,
                  image: AssetImage('images/logo.png'),
                ),
                Text(
                  'Sign In as a Rider',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email address',
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle:
                              TextStyle(fontSize: 10.0, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle:
                              TextStyle(fontSize: 10.0, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Container(
                          height: 50.0,
                          child: Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                  fontSize: 20.0, fontFamily: 'Brand-Bold'),
                            ),
                          ),
                        ),
                        color: BrandColors.colorGreen,
                        textColor: Colors.white,
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        RegistrationPage.routeName, (route) => false);
                  },
                  child: Text('Don\'t have an account, sign up here.'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
