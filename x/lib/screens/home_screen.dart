import 'package:flutter/material.dart';
import 'package:x/constants/colors.dart';
import 'data.dart';
import 'homepage_screen.dart';
import 'new_post_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; // เก็บค่า index ของหน้าที่เลือก

  final List<Widget> _pages = [
    HomePage(),
    Center(child: Text("🔍 Search Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("👤 Profile Page", style: TextStyle(fontSize: 24))),
    Center(child: Text("💬 chat Page", style: TextStyle(fontSize: 24))),
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
        foregroundColor: text_colors,
        scrolledUnderElevation: 0,
      ),
      body: _pages[_selectedIndex], // แสดงหน้าตาม index
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
          : null, // ซ่อนปุ่มเพิ่มโพสต์เมื่อไม่ได้อยู่หน้า Home
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
        selectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color.fromARGB(
            255, 90, 90, 90), // กำหนดสีพื้นหลังให้เหมือน AppBar
        elevation: 0, // ลบเงาหรือเส้นขอบด้านบน
        type: BottomNavigationBarType
            .fixed, 
          ),
    );
  }
}
