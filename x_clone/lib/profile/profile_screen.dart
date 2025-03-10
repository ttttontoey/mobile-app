import 'package:flutter/material.dart';
import 'editprofile.dart';
import 'settings_screen.dart';

class ProfileScreen extends StatefulWidget {
  final List<Map<String, dynamic>> tweets;

  const ProfileScreen({super.key, required this.tweets});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'แต่งไม่จบหรอกนิยายอะ';
  String username = '@Praedaoo';
  String bio = '#รีวิวให้สุดสวย #รีวิวแพรดาว.';
  String profileImage = 'assets/images/post4.jpg';
  String birthdate = '7 มิถุนายน ค.ศ. 2002';
  String joinDate = 'พฤษภาคม ค.ศ. 2020';
  int following = 166;
  int followers = 75;

  List<Map<String, dynamic>> tweets = [];

  @override
  void initState() {
    super.initState();
    tweets = widget.tweets;
  }

  void updateProfile(Map<String, dynamic> updatedData) {
    setState(() {
      name = updatedData['name'] ?? name;
      username = updatedData['username'] ?? username;
      bio = updatedData['bio'] ?? bio;
      profileImage = updatedData['profileImage'] ?? profileImage;
      birthdate = updatedData['birthdate'] ?? birthdate;
      joinDate = updatedData['joinDate'] ?? joinDate;
      following = updatedData['following'] ?? following;
      followers = updatedData['followers'] ?? followers;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingsScreen()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/post4.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  bottom: -40,
                  left: 16,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.black,
                    child: ClipOval(
                      child: Image.asset(profileImage,
                          width: 100, height: 100, fit: BoxFit.cover),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text(username,
                              style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditProfileScreen(
                                currentName: name,
                                currentUsername: username,
                                currentBio: bio,
                                currentProfileImage: profileImage,
                                currentBirthdate: birthdate,
                                currentJoinDate: joinDate,
                                currentFollowing: following,
                                currentFollowers: followers,
                              ),
                            ),
                          );
                          if (result != null) {
                            updateProfile(result);
                          }
                        },
                        child: const Text('แก้ไขโปรไฟล์'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(bio,
                      style:
                          const TextStyle(fontSize: 16, color: Colors.white)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('เกิดเมื่อ $birthdate',
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.date_range,
                          size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('เข้าร่วมเมื่อ $joinDate',
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('$following ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const Text('กำลังติดตาม',
                          style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 16),
                      Text('$followers ',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const Text('ผู้ติดตาม',
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 8),
                  const Text(
                    "โพสต์ล่าสุด",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tweets.length,
                    itemBuilder: (context, index) {
                      final tweet = tweets[index];
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(profileImage),
                        ),subtitle: Text(
                          username,
                          style: const TextStyle(color: Colors.grey),
                        ),
                        title: Text(
                          tweet['content'] ?? 'ไม่มีข้อความ',
                          style: const TextStyle(color: Colors.white),
                        ),
                        
                      );
                    },
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
// import 'editprofile.dart';
// import 'settings_screen.dart';

// class ProfileScreen extends StatefulWidget {
//   final List<Map<String, dynamic>> tweets;

//   const ProfileScreen({super.key, required this.tweets});
//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   String name = 'แต่งไม่จบหรอกนิยายอะ';
//   String username = '@Praedaoo';
//   String bio = '#รีวิวให้สุดสวย #รีวิวแพรดาว.';
//   String profileImage = 'assets/images/post4.jpg';
//   String birthdate = '7 มิถุนายน ค.ศ. 2002';
//   String joinDate = 'พฤษภาคม ค.ศ. 2020';
//   int following = 166;
//   int followers = 75;

//   void updateProfile(Map<String, dynamic> updatedData) {
//     setState(() {
//       name = updatedData['name'];
//       username = updatedData['username'];
//       bio = updatedData['bio'];
//       profileImage = updatedData['profileImage'];
//       birthdate = updatedData['birthdate'];
//       joinDate = updatedData['joinDate'];
//       following = updatedData['following'];
//       followers = updatedData['followers'];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         automaticallyImplyLeading: false,
//         title: const Text('Profile', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                       builder: (context) => const SettingsScreen()));
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Container(
//                   height: 180,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/post4.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: -40,
//                   left: 16,
//                   child: CircleAvatar(
//                     radius: 50,
//                     backgroundColor: Colors.black,
//                     child: ClipOval(
//                       child: Image.asset(profileImage,
//                           width: 100, height: 100, fit: BoxFit.cover),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 50),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(name,
//                               style: const TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white)),
//                           Text(username,
//                               style: const TextStyle(color: Colors.grey)),
//                         ],
//                       ),
//                       ElevatedButton(
//                         onPressed: () async {
//                           final result = await Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => EditProfileScreen(
//                                 currentName: name,
//                                 currentUsername: username,
//                                 currentBio: bio,
//                                 currentProfileImage: profileImage,
//                                 currentBirthdate: birthdate,
//                                 currentJoinDate: joinDate,
//                                 currentFollowing: following,
//                                 currentFollowers: followers,
//                               ),
//                             ),
//                           );
//                           if (result != null) {
//                             updateProfile(result);
//                           }
//                         },
//                         child: const Text('แก้ไขโปรไฟล์'),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Text(bio,
//                       style:
//                           const TextStyle(fontSize: 16, color: Colors.white)),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       const Icon(Icons.calendar_today,
//                           size: 16, color: Colors.grey),
//                       const SizedBox(width: 4),
//                       Text('เกิดเมื่อ $birthdate',
//                           style: const TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       const Icon(Icons.date_range,
//                           size: 16, color: Colors.grey),
//                       const SizedBox(width: 4),
//                       Text('เข้าร่วมเมื่อ $joinDate',
//                           style: const TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: [
//                       Text('$following ',
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white)),
//                       const Text('กำลังติดตาม',
//                           style: TextStyle(color: Colors.grey)),
//                       const SizedBox(width: 16),
//                       Text('$followers ',
//                           style: const TextStyle(
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white)),
//                       const Text('ผู้ติดตาม',
//                           style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   const Divider(color: Colors.grey),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'editprofile.dart';
// import 'settings_screen.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   _ProfileScreenState createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   String name = 'แต่งไม่จบหรอกนิยายอะ';
//   String username = '@Praedaoo';
//   String bio = '#รีวิวให้สุดสวย #รีวิวแพรดาว.';

//   void updateProfile(String newName, String newUsername, String newBio) {
//     setState(() {
//       name = newName;
//       username = newUsername;
//       bio = newBio;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Profile', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const SettingsScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               clipBehavior: Clip.none,
//               children: [
//                 Container(
//                   height: 180,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/post4.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   bottom: -30,
//                   left: 16,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Colors.black, width: 4),
//                     ),
//                     child: ClipOval(
//                       child: CircleAvatar(
//                         radius: 50,
//                         backgroundColor: Colors.transparent,
//                         backgroundImage: const AssetImage('assets/images/post4.jpg'),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 40),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             name,
//                             style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//                           ),
//                           Text(
//                             username,
//                             style: const TextStyle(color: Colors.grey),
//                           ),
//                         ],
//                       ),
//                       ElevatedButton(
//                         onPressed: () async {
//                           final result = await Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => EditProfileScreen(
//                                 currentName: name,
//                                 currentUsername: username,
//                                 currentBio: bio,
//                               ),
//                             ),
//                           );
//                           if (result != null) {
//                             updateProfile(result['name'], result['username'], result['bio']);
//                           }
//                         },
//                         child: const Text('แก้ไขโปรไฟล์'),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     bio,
//                     style: const TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: const [
//                       Icon(Icons.calendar_today, size: 16, color: Colors.grey),
//                       SizedBox(width: 4),
//                       Text('เกิดเมื่อ 7 มิถุนายน ค.ศ. 2002', style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   Row(
//                     children: const [
//                       Icon(Icons.date_range, size: 16, color: Colors.grey),
//                       SizedBox(width: 4),
//                       Text('เข้าร่วมเมื่อ พฤษภาคม ค.ศ. 2020', style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: const [
//                       Text('166 ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//                       Text('กำลังติดตาม', style: TextStyle(color: Colors.grey)),
//                       SizedBox(width: 16),
//                       Text('75 ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//                       Text('ผู้ติดตาม', style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   const Divider(color: Colors.grey),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'settings_screen.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Profile', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const SettingsScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               clipBehavior: Clip.none, // ป้องกัน Avatar ถูกตัดขอบ
//               children: [
//                 // 🔹 รูปพื้นหลัง (Cover Image)
//                 Container(
//                   height: 180,
//                   width: double.infinity,
//                   decoration: const BoxDecoration(
//                     image: DecorationImage(
//                       image: AssetImage('assets/images/post4.jpg'), // รูปจาก assets
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 // 🔹 Avatar ซ้อนบน Cover
//                 Positioned(
//                   bottom: -30, // ดัน Avatar ลงมาให้อยู่ครึ่งหนึ่งของ Cover
//                   left: 16,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       border: Border.all(color: Colors.black, width: 4), // เส้นขอบสีดำรอบ Avatar
//                     ),
//                     child: ClipOval(
//                       child: CircleAvatar(
//                         radius: 50, // 🔥 เพิ่มขนาด Avatar
//                         backgroundColor: Colors.transparent,
//                         backgroundImage: const AssetImage('assets/images/post4.jpg'),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 40), // ให้เว้นที่พอให้ Avatar ไม่บังเนื้อหา
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'แต่งไม่จบหรอกนิยายอะ',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                   const Text(
//                     '@Praedaoo',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     '#รีวิวให้สุดสวย #รีวิวแพรดาว.',
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: const [
//                       Icon(Icons.calendar_today, size: 16, color: Colors.grey),
//                       SizedBox(width: 4),
//                       Text('เกิดเมื่อ 7 มิถุนายน ค.ศ. 2002', style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   Row(
//                     children: const [
//                       Icon(Icons.date_range, size: 16, color: Colors.grey),
//                       SizedBox(width: 4),
//                       Text('เข้าร่วมเมื่อ พฤษภาคม ค.ศ. 2020', style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: const [
//                       Text('166 ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//                       Text('กำลังติดตาม', style: TextStyle(color: Colors.grey)),
//                       SizedBox(width: 16),
//                       Text('75 ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//                       Text('ผู้ติดตาม', style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   const Divider(color: Colors.grey),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'settings_screen.dart';

// class ProfileScreen extends StatelessWidget {
//   const ProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black, // พื้นหลังสีดำ
//       appBar: AppBar(
//         title: const Text('Profile', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.settings, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => const SettingsScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Stack(
//               children: [
//                 Container(
//                   height: 150,
//                   decoration: const BoxDecoration(
//                     color: Colors.black, // พื้นหลังส่วนหัวเป็นสีดำ
//                   ),
//                 ),
//                 Positioned(
//                   bottom: 0,
//                   left: 16,
//                   child: CircleAvatar(
//                     radius: 40,
//                     backgroundColor: Colors.grey[800], // สีพื้นหลังเข้มขึ้น
//                     backgroundImage: const NetworkImage(
//                         'https://abs.twimg.com/sticky/default_profile_images/default_profile_400x400.png'),
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const Text(
//                     'Username',
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//                   ),
//                   const Text(
//                     '@username',
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Bio goes here...',
//                     style: TextStyle(fontSize: 16, color: Colors.white),
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: const [
//                       Icon(Icons.location_on, size: 16, color: Colors.grey),
//                       SizedBox(width: 4),
//                       Text('Location', style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   const SizedBox(height: 8),
//                   Row(
//                     children: const [
//                       Text('123 ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//                       Text('Following', style: TextStyle(color: Colors.grey)),
//                       SizedBox(width: 16),
//                       Text('456 ', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
//                       Text('Followers', style: TextStyle(color: Colors.grey)),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//                   const Divider(color: Colors.grey),
//                 ],
//               ),
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               physics: const NeverScrollableScrollPhysics(),
//               itemCount: 10,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   leading: const CircleAvatar(
//                     backgroundImage: NetworkImage(
//                         'https://abs.twimg.com/sticky/default_profile_images/default_profile_400x400.png'),
//                   ),
//                   title: Text('Tweet ${index + 1}', style: const TextStyle(color: Colors.white)),
//                   subtitle: const Text('This is a tweet example.', style: TextStyle(color: Colors.grey)),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// import 'package:flutter/material.dart';

// class ProfileScreen extends StatelessWidget {
//   final String username;

//   const ProfileScreen({super.key, required this.username});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('$username\'s Profile'),
//       ),
//       body: Center(
//         child: Text('Profile of $username', style: TextStyle(fontSize: 20)),
//       ),
//     );
//   }
// }
