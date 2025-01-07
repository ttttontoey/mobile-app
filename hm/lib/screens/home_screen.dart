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
        centerTitle: true,
        leading: const Row(
          mainAxisSize: MainAxisSize.min, // บีบ Row ให้กระชับ
          children: [
            Icon(Icons.local_fire_department, color: Colors.red),
            SizedBox(width: 5),
            Text(
              'TINDER',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.notifications, color: Colors.grey),
          SizedBox(width: 20),
          Icon(Icons.tune, color: Colors.grey),
          SizedBox(width: 20),
          Icon(Icons.bolt, color: Colors.purpleAccent),
          SizedBox(width: 20),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        // selectedItemColor: Colors.blue, // สีไอคอนเมื่อ active
        // unselectedItemColor: Colors.grey, // สีไอคอนเมื่อไม่ได้ active
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department, color: Colors.grey),
            label: 'fire',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.view_list, color: Colors.grey),
            label: 'list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Colors.grey),
            label: 'star',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.forum, color: Colors.grey),
            label: 'forum',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.grey),
            label: 'setting',
          ),
        ],
      ),
    );
  }
}
