import 'package:flutter/material.dart';
import 'package:myapp/constant/constant.dart';
import 'package:myapp/screen/homescreen.dart';
import 'package:myapp/screen/editprofilescreen.dart';

// ignore: unused_import
import '../components/profile_img.dart';
// ignore: unused_import
import '../components/profile_menu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedItem = 0;

  final List<String> _appBarTitles = [
    'Home', // Title for Home Screen
    'Setting', // Title for Setting Screen
    'Favorite', // Title for Favorite Screen
    'Edit Profile', // Title for Edit Profile Screen
  ];

  void _navigationBottomNavBar(int index) {
    setState(() {
      _selectedItem = index;
      print(index);
    });
  }

  final List<Widget> _pages = [
    const HomeScreen(),
    const Text('Setting'),
    const Text('Favorite'),
    const EditProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  backgroundColor: Colors.black,
  appBar: AppBar(
    title: Text("สำหรับคุณ"),
    backgroundColor: Colors.black,
    foregroundColor: Colors.white,
  ),
  body: ListView.builder(
    itemCount: posts.length,
    itemBuilder: (context, index) {
      return PostCard(post: posts[index]);
    },
  ),
  bottomNavigationBar: BottomNavigationBar(
    backgroundColor: Colors.black,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.grey,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'หน้าแรก',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.search),
        label: 'ค้นหา',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'โปรไฟล์',
      ),
    ],
  ),
);
  }
}
