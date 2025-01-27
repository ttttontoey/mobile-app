import 'package:flutter/material.dart';
import 'package:myapp/screen/favoritesscreen.dart';

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
  List<String> profiles = ["เจฟ", "จี๋", "เฟย"];
  int currentIndex = 0;

  final Map<String, String> profileImages = {
    "เจฟ": "images/jeff.jpg",
    "จี๋": "images/jee.jpg",
    "เฟย": "images/fai.jpg",
  };

  List<String> favorites = []; // เก็บโปรไฟล์ที่ถูกกด Like

  void swipeRight() {
    setState(() {
      // เพิ่มโปรไฟล์ลงในรายการ Favorites หากยังไม่มี
      if (!favorites.contains(profiles[currentIndex])) {
        favorites.add(profiles[currentIndex]);
      }
      currentIndex = (currentIndex + 1) % profiles.length;
    });
  }

  void swipeLeft() {
    setState(() {
      currentIndex = (currentIndex - 1 + profiles.length) % profiles.length;
    });
  }

  void navigateToFavorites() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FavoritesScreen(
          favorites: favorites,
          profileImages: profileImages,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite, color: Colors.white),
            onPressed: navigateToFavorites, // ปุ่มไปยังหน้า Favorites
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  for (int i = 0; i < profiles.length; i++)
                    if (i == currentIndex)
                      Card(
                        color: Colors.white,
                        elevation: 5,
                        child: Container(
                          width: 300,
                          height: 400,
                          child: Center(
                            child: Image.asset(
                              profileImages[profiles[i]] ?? '',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Text("Image not found");
                              },
                            ),
                          ),
                        ),
                      ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30.0),
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
