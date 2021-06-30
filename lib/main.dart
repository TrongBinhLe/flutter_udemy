import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_udemy/screens/registrationpage.dart';
import './screens/loginpage.dart';

import './widgets/user_transactions.dart';

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
        Loginpage.routeName: (context) => Loginpage(),
        RegistrationPage.routeName: (context) => RegistrationPage(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  // String titleInput;
  // String amountInput;
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue,
                child: Text('CHART!'),
                elevation: 5,
              ),
            ),
            Center(
              child: MaterialButton(
                color: Colors.amber,
                onPressed: () {
                  DatabaseReference dbref =
                      FirebaseDatabase.instance.reference().child('Test');
                  dbref.set('trogbinhle');
                },
              ),
            ),
            UserTransactions()
          ],
        ),
      ),
    );
  }
}
