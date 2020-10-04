import 'package:flutter/material.dart';
import 'package:flutterappsss/Screen/home_screen.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
//          padding: EdgeInsets.all(20.0),
        child: ListView(
          children: <Widget>[
            //logo
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: new EdgeInsets.symmetric(vertical: 50),
                  child: Image.asset(
                    'assets/images/Spider.jpg',
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )),

            //1

            Container(
              child: TextFormField(
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.red),
                  labelText: "Name",
//under icon
                  prefixIcon: Icon(Icons.person),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                ),
              ),
            ),

            //2

            Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.red),
                  labelText: "Enter Email",
//under icon
                  prefixIcon: Icon(Icons.email),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                ),
              ),
            ),

            //3

            Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                obscureText: true, // Use secure text for passwords.
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelStyle: TextStyle(color: Colors.red),
                  labelText: 'Enter your password',
                  prefixIcon: Icon(Icons.lock),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                ),
              ),
            ),

            //4

            Container(
              padding: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                obscureText: true, // Use secure text for passwords.
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.red),
                  hintText: 'Confirm Password',
                  labelText: 'Enter your confirm password',
                  prefixIcon: Icon(Icons.lock),
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "Poppins",
                ),
              ),
            ),

            Padding(padding: EdgeInsets.only(top: 40.0)),

            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              padding: const EdgeInsets.all(0.0),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Colors.black87,
                      Colors.red,
                      Colors.black87,
                    ],
                  ),
                ),
                padding: const EdgeInsets.all(10.0),
                child: Center(
                  child: Text(
                    'Register ',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
