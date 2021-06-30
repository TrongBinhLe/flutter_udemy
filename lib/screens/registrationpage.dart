import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import '../brand_colors.dart';
import './loginpage.dart';
import '../widgets/taxibutton.dart';

class RegistrationPage extends StatefulWidget {
  static const String routeName = '/registration_page';

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  var fullNameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var passController = TextEditingController();

  void showSnackbar(String title) {
    final snackBar = new SnackBar(
      content: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15),
      ),
    );
    scaffoldKey.currentState.showSnackBar(snackBar);
  }

  void registerUser() async {
    try {
      final FirebaseUser user = (await _auth.createUserWithEmailAndPassword(
              email: emailController.text, password: passController.text))
          .user;
      if (user != null) {
        print('registration successfull');
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                  'Create a Rider\'s Account',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
                ),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        controller: fullNameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          labelText: 'Full name',
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle:
                              TextStyle(fontSize: 10.0, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email address',
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle:
                              TextStyle(fontSize: 10.0, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Phone number',
                          labelStyle: TextStyle(fontSize: 14.0),
                          hintStyle:
                              TextStyle(fontSize: 10.0, color: Colors.grey),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        controller: passController,
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
                      TaxiButton(
                        title: 'REGISTER',
                        color: BrandColors.colorGreen,
                        onPress: () {
                          // check network validation

                          if (fullNameController.text.length < 3) {
                            showSnackbar('Please provide a valid fullname');
                            return;
                          }
                          if (!emailController.text.contains('@')) {
                            showSnackbar(
                                'Please provide a valid email address');
                            return;
                          }
                          if (phoneController.text.length < 10) {
                            showSnackbar(
                                'Please provide a valid phone number.');
                            return;
                          }
                          if (passController.text.length < 8) {
                            showSnackbar(
                                'password must be at least 8 characters');
                            return;
                          }

                          registerUser();
                        },
                      )
                    ],
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        Loginpage.routeName, (route) => false);
                  },
                  child: Text('Already have a RIDER account? Log in'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
