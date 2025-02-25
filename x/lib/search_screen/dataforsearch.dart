import 'package:flutter/material.dart';

class DataforSearchScreen extends StatelessWidget {
  const DataforSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String query = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("Results for \"$query\""),
      ),
      body: Center(
        child: Text("Showing search results for: $query", 
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
