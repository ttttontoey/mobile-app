import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: ListView(
        children: [
          Container(
            height: 100,
            color: Colors.blue[400],
            child: const Center(
              child: Text('Test My App'),
            ),
          ),
          Container(
            height: 100,
            color: Colors.blue[200],
            child: const Center(
              child: Text('Test My App'),
            ),
          ),
          Container(
            height: 100,
            color: Colors.blue,
            child: const Center(
              child: Text('Test My App'),
            ),
          ),
        ],
      ),
      appBar: AppBar(
        title: const Text('Edit profile'),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 5),
          Icon(Icons.add_a_photo),
          SizedBox(width: 20),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_sharp),
            label: 'business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'setting',
          ),
        ],
      ),
    );
  }
}
