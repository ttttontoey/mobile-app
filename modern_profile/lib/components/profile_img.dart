import 'package:flutter/material.dart';

// ignore: unused_import
import '../constant/constant.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            backgroundColor:Color.fromARGB(255, 189, 189, 189),
            radius: 60,
            child: CircleAvatar(
              radius: 55,
              backgroundImage: AssetImage('images/profile.jpg'),
            ),
          ),
          CircleAvatar(
            backgroundColor:Color.fromARGB(255, 189, 189, 189),
            radius: 22,
            child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 70, 135, 189),
              child: Icon(
                Icons.edit,
                size: 20,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
