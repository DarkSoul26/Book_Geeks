import 'package:book_geeks/pages/Welcome/login.dart';
import 'package:book_geeks/pages/Welcome/welcome.dart';
import 'package:book_geeks/pages/home/home.dart';
import 'package:book_geeks/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/user_model.dart';

class Wrapper extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<UserAttributes>(
        stream: authService.user,
        // ignore: missing_return
        builder: (_, AsyncSnapshot<UserAttributes> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final UserAttributes user = snapshot.data;
            return user == null ? LoginPage() : Home();
          } else {
            return Scaffold(
              body: Welcome(),
            );
          }
        });
  }
}
