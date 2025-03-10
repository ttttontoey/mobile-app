import 'package:flutter/material.dart';
import 'SignIn/signin_screen.dart';  // หน้าลงชื่อเข้าใช้งาน
import 'SignIn/signup_screen copy.dart';
import 'home_screens/home_screen.dart'; // หน้า Home
import 'profile/settings_screen.dart'; // หน้า Settings
import 'search_screen/dataforsearch.dart'; // หน้า DataforSearch

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
      theme: ThemeData.light(), // สามารถเปลี่ยนเป็น ThemeData.dark() ได้ถ้าต้องการ
      initialRoute: '/signup', // เริ่มต้นที่หน้า SignUpPage
      routes: {
        '/signup': (context) =>  SignUpPage(), // แก้ให้ถูกต้อง
        '/home': (context) => const HomeScreen(),
        '/DataforSearch': (context) => const DataforSearchScreen(),
        '/signin': (context) =>  SignInPage(), // เส้นทางหน้า Sign In
        '/settings': (context) => const SettingsScreen(), // เส้นทางหน้า Settings
      },
    );
  }
}
