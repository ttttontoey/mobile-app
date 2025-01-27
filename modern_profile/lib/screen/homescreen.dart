import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  List<String> profiles = ["John", "Emily", "James", "Alice"];
  int currentIndex = 0;

  // สร้างแผนที่เพื่อเชื่อมโยงชื่อกับเส้นทางของรูปภาพ
  final Map<String, String> profileImages = {
    "เจฟ": "images/jeff.jpg",
    "จี๋": "images/jee.jpg",
    "เฟย": "images/fai.jpg",
  };

  // Function to simulate swiping
  void swipeRight() {
    setState(() {
      currentIndex = (currentIndex + 1) % profiles.length;
    });
  }

  void swipeLeft() {
    setState(() {
      currentIndex = (currentIndex - 1 + profiles.length) % profiles.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // This creates a stack of cards
            for (int i = 0; i < profiles.length; i++)
              if (i == currentIndex)
                Positioned(
                  child: Card(
                    color: Colors.white,
                    elevation: 5,
                    child: Container(
                      width: 300,
                      height: 400,
                      child: Center(
                        // ใช้ Image.asset ตามชื่อใน profileImages
                        child: Image.asset(
                          profileImages[profiles[i]] ??
                              '', // ใช้แผนที่เพื่อดึงเส้นทางรูปภาพ
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
            // "Like", "Dislike", etc buttons
            Positioned(
              bottom: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.clear, color: Colors.red, size: 40),
                    onPressed: swipeLeft,
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.favorite,
                        color: Colors.green, size: 40),
                    onPressed: swipeRight,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:myapp/components/profile_img.dart';
// import 'package:myapp/components/profile_menu.dart';
// import 'package:myapp/constant/constant.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         children: [
//           const SizedBox(
//             height: 10,
//           ),
//           const ProfileImage(),
//           const SizedBox(height: 20),
//           Text(
//             'Mongkolrach Wadsuntad',
//             style: textTitle,
//           ),
//           const SizedBox(height: 3),
//           Text(
//             's6503051624076@email.kmutnb.ac.th',
//             style: textSubTitle,
//           ),
//           const SizedBox(height: 5),
//           Container(
//             width: 150,
//             height: 50,
//             decoration: BoxDecoration(
//               color: const Color.fromARGB(255, 106, 173, 228),
//               borderRadius: BorderRadius.circular(25.0),
//             ),
//             child: Center(
//                 child: Text(
//               'Edit Profile',
//               style: textBtn,
//             )),
//           ),
//           //profile menu
//           const SizedBox(
//             height: 20,
//           ),
//           const ProfileMenu(
//             title: 'Setting',
//             icons: Icons.settings,
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           const ProfileMenu(
//             title: 'Billing Detail',
//             icons: Icons.wallet,
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           const ProfileMenu(
//             title: 'User Management',
//             icons: Icons.person,
//           ),
//           const SizedBox(
//             height: 300,
//           ),
//           const ProfileMenu(
//             title: 'Favorite',
//             icons: Icons.favorite,
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           const ProfileMenu(
//             title: 'Log out',
//             icons: Icons.logout,
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//         ],
//       ),
//     );
//   }
// }
