import 'package:book_geeks/pages/Welcome/signup.dart';
import 'package:book_geeks/pages/home/home.dart';
import 'package:book_geeks/services/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './animation/FadeAnimation.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    bool flag = false;
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        FadeAnimation(
                            1,
                            Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 40, fontWeight: FontWeight.w900),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                        FadeAnimation(
                            1.2,
                            Text(
                              "Login to your account",
                              style: TextStyle(
                                  fontSize: 15, color: Colors.grey[700]),
                            )),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Column(
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FadeAnimation(
                                  1.2,
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Email',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black87),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter some text';
                                          }
                                          //print(value);
                                          return null;
                                        },
                                        keyboardType: TextInputType.emailAddress,
                                        autofillHints: [AutofillHints.email],
                                        controller: emailController,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey[400])),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey[400])),
                                          suffixIcon: emailController.text.isEmpty ?
                                            Container(width: 0) :
                                              IconButton(
                                                icon: Icon(Icons.close),
                                                onPressed: () => emailController.clear(),
                                              )
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                FadeAnimation(
                                  1.3,
                                  Column(
                                    children: <Widget>[
                                      Text(
                                        'Password',
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w400,
                                            color: Colors.black87),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Please enter details';
                                          }
                                          if (value.length < 6)
                                            return 'Enter password greater than 5';
                                          //print(value);
                                          return null;
                                        },
                                        controller: passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 0, horizontal: 10),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey[400])),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey[400])),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                                FadeAnimation(
                                    1.4,
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 40),
                                      child: Container(
                                        padding:
                                            EdgeInsets.only(top: 3, left: 3),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.black),
                                              top: BorderSide(
                                                  color: Colors.black),
                                              left: BorderSide(
                                                  color: Colors.black),
                                              right: BorderSide(
                                                  color: Colors.black),
                                            )),
                                        child: MaterialButton(
                                          minWidth: double.infinity,
                                          height: 60,
                                          onPressed: () async {
                                            try {
                                              if (_formKey.currentState
                                                  .validate()) {
                                                authService
                                                    .signInWithEmailAndPassword(
                                                  emailController.text,
                                                  passwordController.text,
                                                )
                                                    .then((_) {
                                                  flag = true;
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              Home()));
                                                });
                                                if (flag) {
                                                  AlertDialog(
                                                    title: const Text(
                                                        'Wrong Entry for Login'),
                                                    content: const Text(
                                                        'Enter valid email and password'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context, 'OK'),
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  );
                                                }
                                              } else {
                                                showDialog<String>(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) =>
                                                          AlertDialog(
                                                    title: const Text(
                                                        'Wrong Entry for Login'),
                                                    content: const Text(
                                                        'Enter valid details'),
                                                    actions: <Widget>[
                                                      TextButton(
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context, 'OK'),
                                                        child: const Text('OK'),
                                                      ),
                                                    ],
                                                  ),
                                                );
                                              }
                                            } on FirebaseAuthException catch (e) {
                                              if (e.code == 'weak-password') {
                                                print(
                                                    'The password provided is too weak.');
                                              } else if (e.code ==
                                                  'email-already-in-use') {
                                                print(
                                                    'The account already exists for that email.');
                                              }
                                            } catch (e) {
                                              print(e);
                                            }
                                          },
                                          color: Colors.greenAccent,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(50)),
                                          child: Text(
                                            "Login",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeAnimation(
                        1.5,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Don't have an account at Book Geeks?"),
                            Padding(padding: EdgeInsets.all(10.0)),
                            GestureDetector(
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 18),
                              ),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignupPage()),
                                );
                              },
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            FadeAnimation(
                1.2,
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('./assets/images/login.png'),
                          fit: BoxFit.cover)),
                ))
          ],
        ),
      ),
    );
  }
}
