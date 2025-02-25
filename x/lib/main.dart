import 'package:flutter/material.dart';
import 'package:x/SignIn/signup_screen.dart';
// import 'home_screens/home_screen.dart';
import 'search_screen/dataforsearch.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpPage(),
      // home: HomeScreen(),
      routes: {
        '/DataforSearch': (context) => DataforSearchScreen(), // กำหนดเส้นทางไป DataforSearch
      },
    );
  }
}

