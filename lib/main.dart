import 'package:book_geeks/pages/Welcome/login.dart';
import 'package:book_geeks/pages/home/home.dart';
import 'package:book_geeks/pages/welcome/animation/splash_screen.dart';
import 'package:book_geeks/services/auth_service.dart';
import 'package:book_geeks/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
      ],
      child: MaterialApp(
          title: 'Book Geeks',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            textTheme: GoogleFonts.catamaranTextTheme(),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: '/splash',
          routes: {
            '/': (context) => Wrapper(),
            '/login': (context) => LoginPage(),
            '/home': (context) => Home(),
            '/splash': (context) => Splash(),
          }
        ),
    );
  }
}
