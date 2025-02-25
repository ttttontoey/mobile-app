import 'package:flutter/material.dart';
import 'package:x/constants/colors.dart';
import '../search_screen/search_screen.dart';
import 'data.dart';
import 'homepage_screen.dart';
import 'new_post_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    SearchScreen(), // ใช้หน้า SearchScreen แทน
    Center(child: Text("👤 Profile Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("💬 Chat Page", style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg_colors,
      appBar: AppBar(
        title: Text('X'),
        centerTitle: true,
        backgroundColor: bg_colors,
        foregroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
      body: _pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () async {
                final newPost = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NewPostScreen()),
                );

                if (newPost != null) {
                  setState(() {
                    tweets.insert(0, newPost);
                  });
                }
              },
              child: Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                _selectedIndex == 1 ? Icons.search : Icons.search_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(_selectedIndex == 2 ? Icons.person : Icons.person_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(_selectedIndex == 3 ? Icons.chat : Icons.chat_outlined),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Color.fromARGB(255, 90, 90, 90),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
