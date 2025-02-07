import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String username;

  ProfileScreen({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$username\'s Profile'),
      ),
      body: Center(
        child: Text('Profile of $username', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
