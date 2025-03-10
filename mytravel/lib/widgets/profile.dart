import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mytravel/screens/signin_screen.dart';

import '../screens/introduction_screen.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
  });

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {

  signOut() async {
    await FirebaseAuth.instance.signOut();
    const OnboardingScreen();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const SignInPage()),
      );
  }

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile.jpg'),
          radius: 25,
        ),
        const Spacer(),
        IconButton(onPressed: signOut, icon:const Icon(Icons.exit_to_app,size: 28.0,color: Colors.red,) )
      ],
    );
  }
}
