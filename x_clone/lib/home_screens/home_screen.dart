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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // ✅ ฟังก์ชันเพิ่มโพสต์ใหม่
  void addNewPost(Map<String, dynamic> newPost) {
    setState(() {
      tweets.insert(0, newPost);
    });
  }

  String currentUsername = "แต่งไม่จบหรอกนิยายอะ";
  String currentHandle = "@Praedaoo";

  void updateProfile(String newUsername, String newHandle) {
    setState(() {
      currentUsername = newUsername;
      currentHandle = newHandle;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(currentUsername: currentUsername, currentHandle: currentHandle), // ✅ ส่งค่าไป
      SearchScreen(),
      ProfileScreen(tweets: tweets),
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
                final newPost = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewPostScreen(
                      username: currentUsername,  
                      handle: currentHandle,   
                    ),
                  ),
                );

                if (newPost != null) {
                  setState(() {
                    tweets.insert(0, newPost);
                  });
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





// import 'package:flutter/material.dart';
// import 'package:x/constants/colors.dart';
// import 'package:x/profile/profile_screen.dart';
// import '../chat/main_chat_screen.dart';
// import '../search_screen/search_screen.dart';
// import 'homepage_screen.dart';
// import 'new_post_screen.dart';
// import 'data.dart'; // ✅ เพิ่ม import data.dart

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   // ✅ ฟังก์ชันเพิ่มโพสต์ใหม่
//   void addNewPost(Map<String, dynamic> newPost) {
//     setState(() {
//       tweets.insert(0, newPost); // ✅ เพิ่มโพสต์ใหม่ไปด้านบนสุด
//     });
//   }


//  String currentUsername = "แต่งไม่จบหรอกนิยายอะ";
//   String currentHandle = "@Praedaoo";

//   void updateProfile(String newUsername, String newHandle) {
//     setState(() {
//       currentUsername = newUsername;
//       currentHandle = newHandle;
//     });
//   }


//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> pages = [
//       HomePage(currentUsername: currentUsername, currentHandle: currentHandle),
//       SearchScreen(),
//       ProfileScreen(onUpdateProfile: updateProfile),
//       MainChatScreen(),
//     ];

//     return Scaffold(
//       backgroundColor: bg_colors,
//       appBar: AppBar(
//         title: const Text('X'),
//         centerTitle: true,
//         backgroundColor: bg_colors,
//         foregroundColor: Colors.white,
//         scrolledUnderElevation: 0,
//         automaticallyImplyLeading: false, // 🚫 ซ่อนไอคอนมุมซ้ายบน
//       ),
//       body: pages[_selectedIndex],
//       floatingActionButton: _selectedIndex == 0
//     ? FloatingActionButton(
//         onPressed: () async {
//           final newPost = await Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => NewPostScreen(
//                 username: currentUsername,  // ✅ ส่งค่า username
//                 handle: currentHandle,   // ✅ ส่งค่า handle
//               ),
//             ),
//           );

//           if (newPost != null) {
//             setState(() {
//               tweets.insert(0, newPost); // ✅ เพิ่มโพสต์ใหม่ไปด้านบนสุด
//             });
//           }
//         },
//         child: const Icon(Icons.add),
//       )
//     : null,


//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//                 _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//                 _selectedIndex == 1 ? Icons.search : Icons.search_outlined),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon:
//                 Icon(_selectedIndex == 2 ? Icons.person : Icons.person_outline),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(_selectedIndex == 3 ? Icons.chat : Icons.chat_outlined),
//             label: '',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white70,
//         onTap: _onItemTapped,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         backgroundColor: const Color.fromARGB(255, 90, 90, 90),
//         elevation: 0,
//         type: BottomNavigationBarType.fixed,
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';
// import '../chat/main_chat_screen.dart';
// import '../search_screen/search_screen.dart';
// import '../profile/profile_screen.dart';
// import 'homepage_screen.dart';
// import 'new_post_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   List<Map<String, dynamic>> tweets = []; // ✅ เก็บโพสต์ทั้งหมด

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   // ✅ ฟังก์ชันเพิ่มโพสต์ใหม่
//   void _addNewPost(Map<String, dynamic> newPost) {
//     setState(() {
//       tweets.insert(0, newPost); // ✅ เพิ่มโพสต์ใหม่ไว้ด้านบนสุด
//     });

//     print("✅ newPost ถูกเพิ่ม: ${newPost['content']}");
//     print("✅ จำนวนโพสต์ทั้งหมด: ${tweets.length}");
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> pages = [
//       HomePage(tweets: tweets), // ✅ ส่ง tweets ไปที่ HomePage
//       SearchScreen(),
//       ProfileScreen(tweets: tweets),
//       MainChatScreen(),
//     ];

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('X'),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//         foregroundColor: Colors.white,
//       ),
//       body: pages[_selectedIndex],
//       floatingActionButton: _selectedIndex == 0
//           ? FloatingActionButton(
//               onPressed: () async {
//                 final newPost = await Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const NewPostScreen()),
//                 );

//                 if (newPost != null) {
//                   _addNewPost(newPost); // ✅ อัปเดตโพสต์ใหม่
//                 }
//               },
//               child: const Icon(Icons.add),
//             )
//           : null,
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(_selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(_selectedIndex == 1 ? Icons.search : Icons.search_outlined),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(_selectedIndex == 2 ? Icons.person : Icons.person_outline),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(_selectedIndex == 3 ? Icons.chat : Icons.chat_outlined),
//             label: '',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white70,
//         onTap: _onItemTapped,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         backgroundColor: const Color.fromARGB(255, 90, 90, 90),
//         elevation: 0,
//         type: BottomNavigationBarType.fixed,
//       ),
//     );
//   }
// }









// import 'package:flutter/material.dart';
// import 'package:x/constants/colors.dart';
// import 'package:x/profile/profile_screen.dart';
// import '../chat/main_chat_screen.dart';
// import '../search_screen/search_screen.dart';
// import 'homepage_screen.dart';
// import 'new_post_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   List<Map<String, dynamic>> tweets = []; // ✅ เก็บโพสต์ทั้งหมด

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   // ✅ ฟังก์ชันเพิ่มโพสต์ใหม่
//   void addNewPost(Map<String, dynamic> newPost) {
//     setState(() {
//       tweets.insert(0, newPost); // ✅ เพิ่มโพสต์ใหม่ไว้ด้านบนสุด
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final List<Widget> pages = [
//       HomePage(tweets: tweets), // ✅ ส่ง tweets ไปที่ HomePage
//       SearchScreen(),
//       ProfileScreen(tweets: tweets),
//       MainChatScreen()
//     ];

//     return Scaffold(
//       backgroundColor: bg_colors,
//       appBar: AppBar(
//         title: const Text('X'),
//         centerTitle: true,
//         backgroundColor: bg_colors,
//         foregroundColor: Colors.white,
//         scrolledUnderElevation: 0,
//         automaticallyImplyLeading: false, // 🚫 ซ่อนไอคอนมุมซ้ายบน
//       ),
//       body: pages[_selectedIndex],
//       floatingActionButton: _selectedIndex == 0
//           ? FloatingActionButton(
//               onPressed: () async {
//                 final newPost = await Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => NewPostScreen()),
//                 );

//                 if (newPost != null) {
//                   setState(() {
//                     tweets.insert(0, newPost); // ✅ เพิ่มโพสต์ใหม่ไปด้านบนสุด
//                   });
//                 }
//               },
//               child: const Icon(Icons.add),
//             )
//           : null,
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//                 _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//                 _selectedIndex == 1 ? Icons.search : Icons.search_outlined),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon:
//                 Icon(_selectedIndex == 2 ? Icons.person : Icons.person_outline),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(_selectedIndex == 3 ? Icons.chat : Icons.chat_outlined),
//             label: '',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white70,
//         onTap: _onItemTapped,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         backgroundColor: const Color.fromARGB(255, 90, 90, 90),
//         elevation: 0,
//         type: BottomNavigationBarType.fixed,
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:x/constants/colors.dart';
// import '../chat/main_chat_screen.dart';
// import '../search_screen/search_screen.dart';
// import 'data.dart';
// import 'homepage_screen.dart';
// import 'new_post_screen.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _pages = [
//     HomePage(tweets: [],),
//     SearchScreen(),
//     Center(child: Text("👤 Profile Page", style: TextStyle(fontSize: 24))),
//     MainChatScreen()
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bg_colors,
//       appBar: AppBar(
//         title: const Text('X'),
//         centerTitle: true,
//         backgroundColor: bg_colors,
//         foregroundColor: Colors.white,
//         scrolledUnderElevation: 0,
        
//         /// 🚫 ซ่อนไอคอนมุมซ้ายบน
//         automaticallyImplyLeading: false,
//       ),
//       body: _pages[_selectedIndex],
//       floatingActionButton: _selectedIndex == 0
//           ? FloatingActionButton(
//               onPressed: () async {
//                 final newPost = await Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => NewPostScreen()),
//                 );

//                 if (newPost != null) {
//                   setState(() {
//                     tweets.insert(0, newPost);
//                   });
//                 }
//               },
//               child: const Icon(Icons.add),
//             )
//           : null,
//       bottomNavigationBar: BottomNavigationBar(
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(
//                 _selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//                 _selectedIndex == 1 ? Icons.search : Icons.search_outlined),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon:
//                 Icon(_selectedIndex == 2 ? Icons.person : Icons.person_outline),
//             label: '',
//           ),
//           BottomNavigationBarItem(
//             icon:
//                 Icon(_selectedIndex == 3 ? Icons.chat : Icons.chat_outlined),
//             label: '',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.white,
//         unselectedItemColor: Colors.white70,
//         onTap: _onItemTapped,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         backgroundColor: const Color.fromARGB(255, 90, 90, 90),
//         elevation: 0,
//         type: BottomNavigationBarType.fixed,
//       ),
//     );
//   }
// }
