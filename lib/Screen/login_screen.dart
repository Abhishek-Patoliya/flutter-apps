import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterappsss/Screen/home_screen.dart';
import 'package:flutterappsss/Screen/sign_up.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
  bool checkValue = false;
}

class _LoginScreenState extends State<LoginScreen> {
  String _email, _password;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: new EdgeInsets.symmetric(vertical: 50),
                    child: Image.asset(
                      'assets/images/Spider.jpg',
                      height: 140.0,
                      fit: BoxFit.cover,
                    ),
                  ),

//                Padding(padding: EdgeInsets.only(top: 10.0)),

//Email

                  TextFormField(
                    validator: (emailvalue) {
                      if (emailvalue.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                    // controller: username_controller,
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
                  Padding(padding: EdgeInsets.only(top: 30.0)),

                  //Password
                  TextFormField(
                    validator: (pwdvalue) {
                      if (pwdvalue.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (pwdvalue.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                    // controller: password_controller,
                    decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.red),
                      fillColor: Colors.white,
                      labelText: "Enter PassWord",
                      //under icon
                      prefixIcon: Icon(Icons.lock),

                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                    ),
                    autofocus: false,
                    obscureText: true,
                  ),

                  // Forget Password

                  FlatButton(
                      onPressed: () {
                        //forgot password screen
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      textColor: Colors.white,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forget Password ?",
                          style: TextStyle(fontSize: 15.0),
                          textDirection: TextDirection.ltr,
                        ),
                      )),

                  Padding(padding: EdgeInsets.only(top: 20.0)),

                  //RaisedButton Login

                  RaisedButton(
                    onPressed: () {
                      auth
                          .createUserWithEmailAndPassword(
                              email: _email, password: _password)
                          .then((_) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => HomeScreen()));
                      });

                      //
                      // onPressed: () {
                      // auth.createUserWithEmailAndPassword(
                      //     email: _email, password: _password);
                      //
                      //
                      //
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (context) => HomeScreen()));

                      // String username = username_controller.text;
                      // String password = password_controller.text;
                      // if (username != '' && password != '') {
                      //   print('Successfull');
                      //   logindata.setBool('login', false);
                      //   logindata.setString('username', username);
                      //    Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => HomeScreen()));
                      // }
                    },
                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colors.redAccent,
                            Colors.green,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: const Text(' Login',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w900,
                                color: Colors.black)),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top: 20.0)),

                  //RaisedButton Sign Up

                  RaisedButton(
                    onPressed: () {
                      auth.signInWithEmailAndPassword(
                          email: _email, password: _password);
                      // .then((_) {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },

                    // onPressed: () {

                    // auth.signInWithEmailAndPassword(
                    //     email: _email, password: _password);
                    // Navigator.of(context).pushReplacement(MaterialPageRoute(
                    //     builder: (context) => SignUp()));
                    // },

                    padding: const EdgeInsets.all(0.0),
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: <Color>[
                            Colors.green,
                            Colors.redAccent,

//                            Colors.black87,
//                            Colors.red,
//                            Colorsw.black87,
                          ],
                        ),
                      ),
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
