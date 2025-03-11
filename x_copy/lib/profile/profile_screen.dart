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

  void addNewPost(Map<String, dynamic> newPost) {
    setState(() {
      tweets.insert(0, newPost);
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
                  builder: (context) => const SettingsScreen(),
                ),
              );
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
                  Text(bio, style: const TextStyle(fontSize: 16, color: Colors.white)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('เกิดเมื่อ $birthdate', style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(Icons.date_range, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text('เข้าร่วมเมื่อ $joinDate', style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text('$following ',
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      const Text('กำลังติดตาม', style: TextStyle(color: Colors.grey)),
                      const SizedBox(width: 16),
                      Text('$followers ',
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      const Text('ผู้ติดตาม', style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Divider(color: Colors.grey),
                  const SizedBox(height: 8),
                  
                  // แสดงโพสต์จาก NewPostScreen
                  ListView.builder(
                    
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tweets.length,
                    itemBuilder: (context, index) {
                      final post = tweets[index];
                      return ListTile(
                        subtitle: Text(post['username'], style: const TextStyle(color: Colors.grey)),
                        title: Text(post['content'], style: const TextStyle(color: Colors.white)),
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