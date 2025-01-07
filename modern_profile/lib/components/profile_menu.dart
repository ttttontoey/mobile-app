// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constant/constant.dart';

class ProfileMenu extends StatelessWidget {
  final String title;
  final IconData icons;

  const ProfileMenu({
    Key? key,
    required this.title,
    required this.icons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 40,
      child: Row(
        children: [
           CircleAvatar(
            backgroundColor: const Color.fromARGB(255, 70, 135, 189),
            child: Icon(
              icons, 
              size: 24, 
              color: const Color.fromARGB(255, 255, 255, 255)),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: textSubTitle,
          ),
          const SizedBox(
            width: 10,
          ),
          const Spacer(), //จัดหน้าเมนู

          const CircleAvatar(
            radius: 16,
            backgroundColor: Color.fromARGB(255, 70, 135, 189),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: iconSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
