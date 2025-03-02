import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mytravel/constants/colors.dart';
// import 'package:mytravel/models/data.dart';
import 'package:mytravel/widgets/dastination.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';
import '../widgets/icon_tab.dart';
import '../widgets/profile.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List destinationAPI = [];
  bool isLoading = true;

//Step 3: Create initState()
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://localhost:3000/items'));
    if (response.statusCode == 200) {
      setState(() {
        destinationAPI = json.decode(response.body);
        isLoading = false;
        // print(destinationAPI);
      });
    } else {
      throw Exception('Failed to load products');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 250, 245, 240), // เพิ่มสีพื้นหลังที่นี่
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //row 1 - profile image and menu
              const ProfileWidget(),
              const SizedBox(
                height: 20,
              ),
              //row 2 text
              Text(
                "Point Of Interest",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: primaryColors,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              //Row 3 text box - textfield
              const SizedBox(
                height: 20,
              ),
              const SearchingBar(),
              //row 4 -icon tab
              const SizedBox(
                height: 20,
              ),
              const IconTab(),
              //Row 5 - Top destinations
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text(
                    "Top Destinations",
                    style: TextStyle(
                      fontSize: 25,
                      color: primaryColors,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.tune,
                    size: 25,
                    color: primaryColors,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              GridView.count(
                crossAxisCount: 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                childAspectRatio: 0.75,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                children: List.generate(destinationAPI.length, (index) {
                  // var e = destination[index];
                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    columnCount: 2,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: DestinationWidget(
                            name: destinationAPI[index]["name"],
                            image: destinationAPI[index]["image"],
                            rate: destinationAPI[index]["rate"],
                            location: destinationAPI[index]["location"]),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
