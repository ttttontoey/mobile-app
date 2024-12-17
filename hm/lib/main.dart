import 'package:flutter/material.dart';
import 'package:hm/screens/home_screen.dart';

void main() {
  runApp(const Hm());
}

class Hm extends StatelessWidget {
  const Hm({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
