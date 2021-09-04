import 'dart:async';

import 'package:book_geeks/pages/home/home.dart';
import 'package:book_geeks/pages/welcome/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Splash extends StatefulWidget {
  static const routeName = '/splash';

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  AnimationController animation;
  Animation<double> _fadeInFadeOut;
  @override
  void initState() {
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    _fadeInFadeOut = Tween<double>(begin: 0.2, end: 1).animate(animation);
    Timer(Duration(seconds: 6), () async {
      final pref = await SharedPreferences.getInstance();
      String token = pref.getString('token');
      if (token == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    });

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation.forward();
      }
    });
    animation.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Center(
          child: FadeTransition(
            opacity: _fadeInFadeOut,
            child: new Image.asset('./assets/images/logo.png'),
          ),
        ),
      ),
    );
  }
}
