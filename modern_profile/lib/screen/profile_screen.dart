import 'package:flutter/material.dart';
import 'package:myapp/constant/constant.dart';
import 'package:myapp/screen/homescreen.dart';
import 'package:myapp/screen/editprofilescreen.dart';

import '../components/profile_img.dart';
import '../components/profile_menu.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedItem = 0;

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
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Color.fromARGB(255, 70, 135, 189),
        ),
        title: Center(
          child: Text(
            'Edit Profile',
            style: textTitle,
          ),
        ),
        actions: const [
          Icon(
            Icons.exit_to_app,
            size: 20,
            color: Color.fromARGB(255, 70, 135, 189),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: _pages[_selectedItem],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedItem,
        onTap: _navigationBottomNavBar,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 30,
              color: Color.fromARGB(255, 70, 135, 189),
            ),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings,
              size: 30,
              color: Color.fromARGB(255, 70, 135, 189),
            ),
            label: 'setting',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              size: 30,
              color: Color.fromARGB(255, 70, 135, 189),
            ),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              size: 30,
              color: Color.fromARGB(255, 70, 135, 189),
            ),
            label: 'Edit profile',
          ),
        ],
      ),
    );
  }
}
