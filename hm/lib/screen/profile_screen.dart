import 'package:flutter/material.dart';
import 'package:myapp/constant/constant.dart';
import 'package:myapp/main.dart';
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
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Color.fromARGB(255, 70, 135, 189),
        ),
        title: Center(
          child: Text(
            _appBarTitles[_selectedItem],
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
