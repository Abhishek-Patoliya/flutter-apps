//
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'package:firebase_core/firebase_core.dart';
//
//
// class SignUp extends StatefulWidget {
//   final Function cancelBackToHome;
//
//   SignUp({this.cancelBackToHome});
//
//   @override
//   _SignUpState createState() => _SignUpState();
// }
//
// class _SignUpState extends State<SignUp> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String email, password, passwordConfirm;
//   bool _termsAgreed = false;
//   bool saveAttempted = false;
//   final formKey = GlobalKey<FormState>();
//
//   void _createUser({String email, String pw}) {
//     _auth
//         .createUserWithEmailAndPassword(email: email, password: pw)
//         .then((authResult) {
//       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
//         return Container(
//           color: Colors.yellow,
//           child: Text('Welcome ${authResult.user.email}'),
//         );
//       }));
//     }).catchError((err) {
//       print(err.code);
//       if (err.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
//         showCupertinoDialog(
//             context: context,
//             builder: (context) {
//               return CupertinoAlertDialog(
//                 title: Text(
//                     'This email already has an account associated with it'),
//                 actions: <Widget>[
//                   CupertinoDialogAction(
//                     child: Text('OK'),
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                   )
//                 ],
//               );
//             });
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Form(
//       key: formKey,
//       child: Container(
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           children: <Widget>[
//             Text(
//               'CREATE YOUR LOGIN',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 26.0,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             TextFormField(
//               autovalidate: saveAttempted,
//               onChanged: (textValue) {
//                 setState(() {
//                   email = textValue;
//                 });
//               },
//               validator: (emailValue) {
//                 if (emailValue.isEmpty) {
//                   return 'This field is mandatory';
//                 }
//
//                 String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
//                     "\\@" +
//                     "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
//                     "(" +
//                     "\\." +
//                     "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
//                     ")+";
//                 RegExp regExp = new RegExp(p);
//
//                 if (regExp.hasMatch(emailValue)) {
//                   // So, the email is valid
//                   return null;
//                 }
//
//                 return 'This is not a valid email';
//               },
//               decoration: InputDecoration(
//                 errorStyle: TextStyle(
//                   color: Colors.black,
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.black,
//                     )),
//                 hintText: 'Enter Email',
//                 hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
//                 focusColor: Colors.black,
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 22.0,
//               ),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             TextFormField(
//               autovalidate: saveAttempted,
//               onChanged: (textValue) {
//                 setState(() {
//                   password = textValue;
//                 });
//               },
//               validator: (pwValue) {
//                 if (pwValue.isEmpty) {
//                   return 'This field is mandatory';
//                 }
//                 if (pwValue.length < 8) {
//                   return 'Password must be at least 8 characters';
//                 }
//
//                 return null;
//               },
//               obscureText: true,
//               decoration: InputDecoration(
//                 errorStyle: TextStyle(
//                   color: Colors.black,
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.black,
//                     )),
//                 hintText: 'Password',
//                 hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
//                 focusColor: Colors.black,
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 22.0,
//               ),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             TextFormField(
//               autovalidate: saveAttempted,
//               onChanged: (textValue) {
//                 setState(() {
//                   passwordConfirm = textValue;
//                 });
//               },
//               validator: (pwConfValue) {
//                 if (pwConfValue != password) {
//                   return 'Passwords must match';
//                 }
//
//                 return null;
//               },
//               obscureText: true,
//               decoration: InputDecoration(
//                 errorStyle: TextStyle(
//                   color: Colors.black,
//                 ),
//                 enabledBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(
//                       color: Colors.black,
//                     )),
//                 hintText: 'Re-Enter Password',
//                 hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
//                 focusColor: Colors.black,
//                 focusedBorder: UnderlineInputBorder(
//                   borderSide: BorderSide(
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 22.0,
//               ),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 Checkbox(
//                   activeColor: Colors.orange,
//                   value: _termsAgreed,
//                   onChanged: (newValue) {
//                     setState(() {
//                       _termsAgreed = newValue;
//                     });
//                   },
//                 ),
//                 SizedBox(
//                   height: 20.0,
//                 ),
//                 Text(
//                   'Agreed to Terms & Conditions',
//                   style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 16.0,
//                   ),
//                 )
//               ],
//             ),
//             SizedBox(
//               height: 12.0,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 InkWell(
//                   onTap: () {
//                     widget.cancelBackToHome();
//                   },
//                   child: Text(
//                     'CANCEL',
//                     style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   width: 38.0,
//                 ),
//                 InkWell(
//                   onTap: () {
//                     setState(() {
//                       saveAttempted = true;
//                     });
//                     if (formKey.currentState.validate()) {
//                       formKey.currentState.save();
//                       _createUser(email: email, pw: password);
//                     }
//                   },
//                   child: Container(
//                     padding: EdgeInsets.symmetric(
//                       vertical: 16.0,
//                       horizontal: 34.0,
//                     ),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.circular(
//                         30.0,
//                       ),
//                     ),
//                     child: Text(
//                       'SAVE',
//                       style: TextStyle(
//                         color: Colors.red,
//                         fontSize: 20.0,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//           ],
//         ),
//       ),
//     ));
//   }
// }

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappsss/Screen/home_screen.dart';

class SignUp extends StatefulWidget {
  final Function cancelBackToHome;

  SignUp({this.cancelBackToHome});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String email;
  String password;
  String passwordConfirm;
  bool _termsAgreed = true;
  bool saveAttempted = false;

  final formKey = GlobalKey<FormState>();

  void _createUser({String email, String pw}) {
    _auth
        .createUserWithEmailAndPassword(email: email, password: pw)
        .then((authResult) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }).catchError((err) {
      print(err.code);
      if (err.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
        showCupertinoDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                title: Text(
                    'This email already has an account associated with it'),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('OK'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );
            });
      }
    });
  }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:Form(
//       key: formKey,
//       child: Container(
//         color: Colors.black,
//         padding: EdgeInsets.symmetric(horizontal: 24.0),
//         child: Column(
//           children: <Widget>[
//             Container(
//               padding: new EdgeInsets.symmetric(vertical: 50),
//               child: Image.asset(
//                 'assets/images/Spider.jpg',
//                 height: 150.0,
//                 fit: BoxFit.cover,
//               ),
//             ),
//
//             SizedBox(
//               height: 20.0,
//             ),
//
//             //1   Name
//
//             TextFormField(
//               autovalidate: saveAttempted,
//               decoration: const InputDecoration(
//                 labelStyle: TextStyle(color: Colors.red),
//                 labelText: "Name",
// //under icon
//                 prefixIcon: Icon(Icons.person),
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red)),
//               ),
//               keyboardType: TextInputType.emailAddress,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: "Poppins",
//               ),
//             ),
//             SizedBox(
//               height: 20.0,
//             ),
//
//             //2  Email
//             TextFormField(
//               autovalidate: saveAttempted,
//               onChanged: (textValue) {
//                 setState(() {
//                   email = textValue;
//                 });
//               },
//               validator: (emailValue) {
//                 if (emailValue.isEmpty) {
//                   return 'This field is mandatory';
//                 }
//
//                 String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
//                     "\\@" +
//                     "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
//                     "(" +
//                     "\\." +
//                     "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
//                     ")+";
//                 RegExp regExp = new RegExp(p);
//
//                 if (regExp.hasMatch(emailValue)) {
//                   // So, the email is valid
//                   return null;
//                 }
//
//                 return 'This is not a valid email';
//               },
//               decoration: const InputDecoration(
//                 errorStyle: TextStyle(
//                   color: Colors.white,
//                 ),
//                 labelStyle: TextStyle(color: Colors.red),
//                 labelText: "Enter Email",
// //under icon
//                 prefixIcon: Icon(Icons.email),
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red)),
//               ),
//               keyboardType: TextInputType.emailAddress,
//               style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: "Poppins",
//               ),
//             ),
//
//             //3  password
//             SizedBox(
//               height: 20.0,
//             ),
//             TextFormField(
//               autovalidate: saveAttempted,
//
//               onChanged: (textValue) {
//                 setState(() {
//                   password = textValue;
//                 });
//               },
//               validator: (pwValue) {
//                 if (pwValue.isEmpty) {
//                   return 'Please enter some text';
//                 }
//                 if (pwValue.length < 8) {
//                   return 'Password must be at least 8 characters';
//                 }
//                 return null;
//               },
//
//               obscureText: true,
//               // Use secure text for passwords.
//               decoration: InputDecoration(
//                 hintText: 'Password',
//                 labelStyle: TextStyle(color: Colors.red),
//                 labelText: 'Enter your password',
//                 prefixIcon: Icon(Icons.lock),
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red)),
//               ),
//               style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: "Poppins",
//               ),
//             ),
//
//             //4    confirm password
//             SizedBox(
//               height: 20.0,
//             ),
//             TextFormField(
//               autovalidate: saveAttempted,
//
//               onChanged: (textValue) {
//                 setState(() {
//                   passwordConfirm = textValue;
//                 });
//               },
//               validator: (pwConfValue) {
//                 if (pwConfValue != password) {
//                   return 'Password must watch';
//                 }
//
//                 return null;
//               },
//               obscureText: true,
//               // Use secure text for passwords.
//               decoration: InputDecoration(
//                 labelStyle: TextStyle(color: Colors.red),
//                 hintText: 'Confirm Password',
//                 labelText: 'Enter your confirm password',
//                 prefixIcon: Icon(Icons.lock),
//                 fillColor: Colors.white,
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.white)),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.red)),
//               ),
//               style: TextStyle(
//                 color: Colors.white,
//                 fontFamily: "Poppins",
//               ),
//             ),
//
//             RaisedButton(
//               // onPressed: () async {
//               //   try {
//               //     final newuser = await _auth.createUserWithEmailAndPassword(
//               //         email: _email, password: _password);
//               //
//               //     if (newuser != null) {
//               //       Navigator.push(context,
//               //           MaterialPageRoute(builder: (context) => HomeScreen()));
//               //     }
//               //   } catch (e) {
//               //     print(e);
//               //   }
//               // },
//
//               //
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => HomeScreen()));
//               },
//               padding: const EdgeInsets.all(0.0),
//               child: InkWell(
//                 onTap: () {
//                   if (formKey.currentState.validate()) {
//                     formKey.currentState.save();
//                     _createUser(email: email, pw: password);
//                   }
//                 },
//                 child: Container(
//                   padding: EdgeInsets.symmetric(
//                     vertical: 16.0,
//                     horizontal: 34.0,
//                   ),
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: <Color>[
//                         Colors.black87,
//                         Colors.red,
//                         Colors.black87,
//                       ],
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Register ',
//                       style:
//                           TextStyle(fontSize: 17, fontWeight: FontWeight.w900),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//       ) );
//   }
// }

  Widget build(BuildContext context) {
    return Scaffold(
        body:
        Form(
          key: formKey,
          child: Container(
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

                //1   Name

                TextFormField(
                  autovalidate: saveAttempted,

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


                //2  Email

                Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    autovalidate: saveAttempted,

                    onChanged: (textValue) {
                      setState(() {
                        email = textValue;
                      });
                    },

                    validator: (emailValue) {
                      if (emailValue.isEmpty) {
                        return 'This field is mandatory';
                      }

                      String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                          "\\@" +
                          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                          "(" +
                          "\\." +
                          "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                          ")+";
                      RegExp regExp = new RegExp(p);

                      if (regExp.hasMatch(emailValue)) {
                        // So, the email is valid
                        return null;
                      }

                      return 'This is not a valid email';
                    },

                    decoration: const InputDecoration(
                      errorStyle: TextStyle(
                        color: Colors.white,
                      ),
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
                    keyboardType: TextInputType.
                    emailAddress,
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Poppins",
                    ),
                  ),
                ),

                //3  password

                Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    autovalidate: saveAttempted,

                    onChanged: (textValue) {
                      setState(() {
                        password = textValue;
                      });
                    },
                    validator: (pwValue) {
                      if (pwValue.isEmpty) {
                        return 'Please enter some text';
                      }
                      if (pwValue.length < 8) {
                        return 'Password must be at least 8 characters';
                      }
                      return null;
                    },


                    obscureText: true,
                    // Use secure text for passwords.
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

                //4    confirm password

                Container(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: TextFormField(
                    autovalidate: saveAttempted,

                    onChanged: (textValue) {
                      setState(() {
                        passwordConfirm = textValue;
                      });
                    },
                    validator: (pwConfValue) {
                      if (pwConfValue != password) {
                        return 'Password must watch';
                      }

                      return null;
                    },
                    obscureText: true,
                    // Use secure text for passwords.
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

                  // onPressed: () async {
                  //   try {
                  //     final newuser = await _auth.createUserWithEmailAndPassword(
                  //         email: _email, password: _password);
                  //
                  //     if (newuser != null) {
                  //       Navigator.push(context,
                  //           MaterialPageRoute(builder: (context) => HomeScreen()));
                  //     }
                  //   } catch (e) {
                  //     print(e);
                  //   }
                  // },

                  //
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  padding: const EdgeInsets.all(0.0),
                  child: InkWell(
                    onTap: () {
                      if (formKey.currentState.validate()) {
                        formKey.currentState.save();
                        _createUser(email: email, pw: password);
                      }
                    },
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
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight
                              .w900),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ),
        ));
  }

}
