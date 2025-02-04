// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class IconWidget extends StatelessWidget {
  const IconWidget({
    super.key,
    required this.title,
    required this.color,
    required this.icon,
  });
final String title;
final Color color;
final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: color, 
              shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon,color:TextColors,),
        ),
        const SizedBox(height: 5,),
        Text(title ,style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
      ],
    );
  }
}
