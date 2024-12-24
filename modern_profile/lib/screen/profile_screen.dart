import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.amber,
            radius: 60,
            child: CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
          ),
        ],
      ),
    );
  }
}
