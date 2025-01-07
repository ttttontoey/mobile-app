import 'package:flutter/material.dart';
import 'package:myapp/constant/constant.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Stack(
      alignment: Alignment.bottomRight,
      children: [
        const CircleAvatar(
          backgroundColor: Colors.amber,
          radius: 60,
          child: CircleAvatar(
            radius: 55,
            backgroundImage: AssetImage('images/profile.jpg'),
          ),
        ),
        CircleAvatar(
          backgroundColor: bgPrimaryColor,
          radius: 22,
          child: const CircleAvatar(
            backgroundColor: Colors.yellow,
            child: Icon(
              Icons.edit,
              size: 20,
              color: Colors.black,
            ),
          ),
        ),
      ],
    ),
  }
}
