import 'package:flutter/material.dart';
import '../constants/colors.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile.jpg'),
          radius: 25,
        ),
        Spacer(),
        Icon(Icons.menu,size: 25.0,color: primaryColors,),
      ],
    );
  }
}
