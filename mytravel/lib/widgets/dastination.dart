import 'dart:ui';
import 'package:flutter/material.dart';
import '../constants/colors.dart';


class DestinationWidget extends StatelessWidget {
  const DestinationWidget(
      {super.key,
      required this.name,
      required this.image,
      required this.rate,
      required this.location});

  final String name;
  final String image;
  final String rate;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            //Step2: Add Stack
            children: [
              //Step1: Add Container
              Container(
                clipBehavior: Clip.hardEdge,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(25)),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                //Step3: Wrap Positioned
                top: 15,
                right: 15,
                child: ClipRRect(
                  //Step6: Warp ClipRRect
                  borderRadius: BorderRadius.circular(25),
                  child: BackdropFilter(
                    //Step5: Wrap BackFilter
                    filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                    child: Container(
                      //Step4: Wrap Container
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Row(
                        children: [
                          Text(
                            rate,
                            style: const TextStyle(
                              fontSize: 18,
                              color: primaryColors,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          name,
          style: const TextStyle(
              fontSize: 16, color: primaryColors, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 4,
        ),
        Row(
          children: [
            const Icon(Icons.location_on_outlined),
            Text(
              location,
              style: const TextStyle(fontSize: 13, color: secondaryColors),
            ),
          ],
        ),
      ],
    );
  }
}