import 'package:flutter/material.dart';

import '../components/profile_img.dart';
import '../components/profile_menu.dart';
import '../constant/constant.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const ProfileImage(),
          const SizedBox(height: 20),
          Text(
            'Mongkolrach Wadsuntad',
            style: textTitle,
          ),
          const SizedBox(height: 3),
          Text(
            's6503051624076@email.kmutnb.ac.th',
            style: textSubTitle,
          ),
          const SizedBox(height: 5),
          Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 106, 173, 228),
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Center(
                child: Text(
              'Edit Profile',
              style: textBtn,
            )),
          ),
          //profile menu
          const SizedBox(
            height: 20,
          ),
          const ProfileMenu(
            title: 'Setting',
            icons: Icons.settings,
          ),
          const SizedBox(
            height: 15,
          ),
          const ProfileMenu(
            title: 'Billing Detail',
            icons: Icons.wallet,
          ),
          const SizedBox(
            height: 15,
          ),
          const ProfileMenu(
            title: 'User Management',
            icons: Icons.person,
          ),
          const SizedBox(
            height: 300,
          ),
          const ProfileMenu(
            title: 'Favorite',
            icons: Icons.favorite,
          ),
          const SizedBox(
            height: 15,
          ),
          const ProfileMenu(
            title: 'Log out',
            icons: Icons.logout,
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }
}
