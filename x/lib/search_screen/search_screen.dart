import 'package:flutter/material.dart';
import 'package:x/constants/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<String> trendingTopics = [
    "#FlutterDev",
    "#TechNews",
    "#AI",
    "#Crypto",
    "#WorldCup",
    "#MusicAwards",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_colors,
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            color: secondaryColors,
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(color: primaryColors),
          ),
          child: TextField(
            controller: _searchController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Search Twitter",
              hintStyle: TextStyle(color: Colors.white70),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.white),
              contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
            ),
            onSubmitted: (query) {
              Navigator.pushNamed(context, '/DataforSearch', arguments: query);
            },
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Trending Topics", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
          ),
          ...trendingTopics.map((topic) => ListTile(
                title: Text(topic, style: TextStyle(color: Colors.white)),
                onTap: () {
                  // Handle tapping on trending topic
                },
              )),
        ],
      ),
    );
  }
}
