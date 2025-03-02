import 'package:flutter/material.dart';
import 'SignIn/signup_screen copy.dart';
import 'home_screens/home_screen.dart'; // นำเข้า HomeScreen
import 'search_screen/dataforsearch.dart'; // นำเข้า DataforSearchScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social App',
      theme: ThemeData.light(), // สามารถเปลี่ยนเป็น dark() ได้ถ้าต้องการ
      initialRoute: '/signup', // เริ่มต้นที่หน้า SignUpPage
      routes: {
        '/signup': (context) =>  SignUpPage(),
        '/home': (context) => const HomeScreen(),
        '/DataforSearch': (context) => const DataforSearchScreen(),
      },
    );
  }
}
