import 'package:flutter/material.dart';
import 'package:mytravel/constants/colors.dart';
import 'package:mytravel/widgets/icon_widget.dart';

class IconTab extends StatelessWidget {
  const IconTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        IconWidget(
          title: 'Forest',
          color: forestColor,
          icon: Icons.forest,
        ),
        Spacer(),
        IconWidget(
          title: 'sea',
          color: seaColor,
          icon: Icons.water,
        ),
        Spacer(),
        IconWidget(
          title: 'mountain',
          color: mountainColor,
          icon: Icons.forest_outlined,
        ),
        Spacer(),
        IconWidget(
          title: 'aquarium',
          color: aquariumColor,
          icon: Icons.filter_sharp,
        ),
        Spacer(),
        IconWidget(
          title: 'desert',
          color: desertColor,
          icon: Icons.forest,
        ),
        Spacer(),
        IconWidget(
          title: 'volcano',
          color: volcanoColor,
          icon: Icons.forest,
        ),
      ],
    );
  }
}
