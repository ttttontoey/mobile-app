import 'package:flutter/material.dart';
import 'package:x/constants/colors.dart';
import 'package:x/profile/profile_screen.dart';
import '../chat/main_chat_screen.dart';
import '../search_screen/search_screen.dart';
import 'homepage_screen.dart';
import 'new_post_screen.dart';
import 'data.dart'; // ✅ Import data.dart

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  // ✅ ข้อมูลโปรไฟล์ปัจจุบัน
  String currentUsername = "แต่งไม่จบหรอกนิยายอะ";
  String currentHandle = "Praedaoo";
  String currentProfilePicture = "assets/images/post4.jpg"; 

  // ✅ List สำหรับเก็บโพสต์ใหม่
  List<Map<String, dynamic>> newPosts = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // ✅ ฟังก์ชันเพิ่มโพสต์ใหม่โดยใช้ข้อมูลจากโปรไฟล์ปัจจุบัน
  void addNewPost(Map<String, dynamic> newPostContent) {
    setState(() {
      newPosts.insert(0, {
        'username': currentUsername,
        'handle': currentHandle,
        'profilePicture': currentProfilePicture,
        'likes': 0,
        'comments': [],
        'isLiked': false,
        ...newPostContent,
      });
    });
  }

  // ✅ ฟังก์ชันอัปเดตข้อมูลโปรไฟล์
  void updateProfile(String newUsername, String newHandle, String newProfilePicture) {
    setState(() {
      currentUsername = newUsername;
      currentHandle = newHandle;
      currentProfilePicture = newProfilePicture;
    });
  }

  @override
  Widget build(BuildContext context) {
    final combinedPosts = [...newPosts, ...tweets];

    final List<Widget> pages = [
      HomePage(
        currentUsername: currentUsername, 
        currentHandle: currentHandle,
        posts: combinedPosts, // ✅ ส่งโพสต์ที่รวมแล้วไป
      ),
      SearchScreen(),
      ProfileScreen(tweets: combinedPosts), // ✅ เปลี่ยนเป็น combinedPosts
      MainChatScreen(),
    ];

    return Scaffold(
      backgroundColor: bg_colors,
      appBar: AppBar(
        title: const Text('X'),
        centerTitle: true,
        backgroundColor: bg_colors,
        foregroundColor: Colors.white,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () async {
                final newPostContent = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPostScreen(
                      username: currentUsername,
                      handle: currentHandle,
                    ),
                  ),
                );

                if (newPostContent != null) {
                  addNewPost(newPostContent); // ✅ เพิ่มโพสต์ใหม่
                }
              },
              child: const Icon(Icons.add),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 1 ? Icons.search : Icons.search_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 2 ? Icons.person : Icons.person_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(_selectedIndex == 3 ? Icons.chat : Icons.chat_outlined),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: _onItemTapped,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color.fromARGB(255, 90, 90, 90),
        elevation: 0,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}