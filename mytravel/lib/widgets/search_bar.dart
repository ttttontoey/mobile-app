import 'package:flutter/material.dart';

import '../constants/colors.dart';

class SearchingBar extends StatelessWidget {
  const SearchingBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: primaryColors,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
        hintText: 'Sport area',
        hintStyle: TextStyle(color: secondaryColors.withOpacity(0.8)),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        prefixIcon: const Icon(Icons.search, size: 25, color: secondaryColors,),
      ),
    );
  }
}
