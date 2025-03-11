import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  final String currentName;
  final String currentUsername;
  final String currentBio;
  final String currentProfileImage;
  final String currentBirthdate;
  final String currentJoinDate;
  final int currentFollowing;
  final int currentFollowers;

  const EditProfileScreen({
    super.key,
    required this.currentName,
    required this.currentUsername,
    required this.currentBio,
    required this.currentProfileImage,
    required this.currentBirthdate,
    required this.currentJoinDate,
    required this.currentFollowing,
    required this.currentFollowers,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  late TextEditingController _nameController;
  late TextEditingController _usernameController;
  late TextEditingController _bioController;
  late TextEditingController _birthdateController;
  late TextEditingController _joinDateController;
  late TextEditingController _followingController;
  late TextEditingController _followersController;

  String profileImage = '';

  final List<String> imageAssets = [
    'assets/images/post4.jpg',
    'assets/images/post7.jpg',
    'assets/images/post13.jpg',
    'assets/images/psm_profile.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.currentName);
    _usernameController = TextEditingController(text: widget.currentUsername);
    _bioController = TextEditingController(text: widget.currentBio);
    _birthdateController = TextEditingController(text: widget.currentBirthdate);
    _joinDateController = TextEditingController(text: widget.currentJoinDate);
    _followingController =
        TextEditingController(text: widget.currentFollowing.toString());
    _followersController =
        TextEditingController(text: widget.currentFollowers.toString());
    profileImage = widget.currentProfileImage;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
    _birthdateController.dispose();
    _joinDateController.dispose();
    _followingController.dispose();
    _followersController.dispose();
    super.dispose();
  }

  void _selectProfileImage() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Colors.black,
          padding: const EdgeInsets.all(16),
          height: 250,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: imageAssets.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    profileImage = imageAssets[index];
                  });
                  Navigator.pop(context);
                },
                child: ClipOval(
                  child: Image.asset(
                    imageAssets[index],
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title:
            const Text('แก้ไขโปรไฟล์', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, {
                'name': _nameController.text,
                'username': _usernameController.text,
                'bio': _bioController.text,
                'profileImage': profileImage,
                'birthdate': _birthdateController.text,
                'joinDate': _joinDateController.text,
                'following': int.parse(_followingController.text),
                'followers': int.parse(_followersController.text),
              });
            },
            child: const Text('บันทึก', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(profileImage),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.blue,
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt,
                            color: Colors.white, size: 18),
                        onPressed: _selectProfileImage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            TextField(
                controller: _nameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    labelText: 'ชื่อ',
                    labelStyle: TextStyle(color: Colors.grey))),
            TextField(
                controller: _usernameController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    labelText: 'ชื่อผู้ใช้',
                    labelStyle: TextStyle(color: Colors.grey))),
            TextField(
                controller: _bioController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    labelText: 'คำอธิบายตัวเอง',
                    labelStyle: TextStyle(color: Colors.grey))),
            TextField(
                controller: _birthdateController,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                    labelText: 'วันเกิด',
                    labelStyle: TextStyle(color: Colors.grey))),
            // TextField(controller: _joinDateController, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(labelText: 'วันที่เข้าร่วม', labelStyle: TextStyle(color: Colors.grey))),
            // TextField(controller: _followingController, keyboardType: TextInputType.number, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(labelText: 'กำลังติดตาม', labelStyle: TextStyle(color: Colors.grey))),
            // TextField(controller: _followersController, keyboardType: TextInputType.number, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(labelText: 'ผู้ติดตาม', labelStyle: TextStyle(color: Colors.grey))),
          ],
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';

// class EditProfileScreen extends StatefulWidget {
//   final String currentName;
//   final String currentUsername;
//   final String currentBio;
//   final String currentProfileImage;
//   final String currentBirthdate;
//   final String currentJoinDate;
//   final int currentFollowing;
//   final int currentFollowers;

//   const EditProfileScreen({
//     super.key,
//     required this.currentName,
//     required this.currentUsername,
//     required this.currentBio,
//     required this.currentProfileImage,
//     required this.currentBirthdate,
//     required this.currentJoinDate,
//     required this.currentFollowing,
//     required this.currentFollowers,
//   });

//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   late TextEditingController _nameController;
//   late TextEditingController _usernameController;
//   late TextEditingController _bioController;
//   late TextEditingController _birthdateController;
//   late TextEditingController _joinDateController;
//   late TextEditingController _followingController;
//   late TextEditingController _followersController;

//   String profileImage = '';

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.currentName);
//     _usernameController = TextEditingController(text: widget.currentUsername);
//     _bioController = TextEditingController(text: widget.currentBio);
//     _birthdateController = TextEditingController(text: widget.currentBirthdate);
//     _joinDateController = TextEditingController(text: widget.currentJoinDate);
//     _followingController = TextEditingController(text: widget.currentFollowing.toString());
//     _followersController = TextEditingController(text: widget.currentFollowers.toString());
//     profileImage = widget.currentProfileImage;
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _usernameController.dispose();
//     _bioController.dispose();
//     _birthdateController.dispose();
//     _joinDateController.dispose();
//     _followingController.dispose();
//     _followersController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('แก้ไขโปรไฟล์', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.black,
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, {
//                 'name': _nameController.text,
//                 'username': _usernameController.text,
//                 'bio': _bioController.text,
//                 'profileImage': profileImage,
//                 'birthdate': _birthdateController.text,
//                 'joinDate': _joinDateController.text,
//                 'following': int.parse(_followingController.text),
//                 'followers': int.parse(_followersController.text),
//               });
//             },
//             child: const Text('บันทึก', style: TextStyle(color: Colors.blue)),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(controller: _nameController, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(labelText: 'ชื่อ', labelStyle: TextStyle(color: Colors.grey))),
//             TextField(controller: _usernameController, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(labelText: 'ชื่อผู้ใช้', labelStyle: TextStyle(color: Colors.grey))),
//             TextField(controller: _bioController, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(labelText: 'คำอธิบายตัวเอง', labelStyle: TextStyle(color: Colors.grey))),
//             TextField(controller: _birthdateController, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(labelText: 'วันเกิด', labelStyle: TextStyle(color: Colors.grey))),
//             // TextField(controller: _joinDateController, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(labelText: 'วันที่เข้าร่วม', labelStyle: TextStyle(color: Colors.grey))),
//             // TextField(controller: _followingController, keyboardType: TextInputType.number, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(labelText: 'กำลังติดตาม', labelStyle: TextStyle(color: Colors.grey))),
//             // TextField(controller: _followersController, keyboardType: TextInputType.number, style: const TextStyle(color: Colors.white), decoration: const InputDecoration(labelText: 'ผู้ติดตาม', labelStyle: TextStyle(color: Colors.grey))),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// class EditProfileScreen extends StatefulWidget {
//   final String currentName;
//   final String currentUsername;
//   final String currentBio;

//   const EditProfileScreen({
//     super.key,
//     required this.currentName,
//     required this.currentUsername,
//     required this.currentBio,
//   });

//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   late TextEditingController _nameController;
//   late TextEditingController _usernameController;
//   late TextEditingController _bioController;
//   String _profileImage = 'assets/images/profile.jpg';

//   final List<String> availableImages = [
//     'assets/images/post13.jpg',
//     'assets/images/post7.jpg',
//     'assets/images/post4.jpg',
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.currentName);
//     _usernameController = TextEditingController(text: widget.currentUsername);
//     _bioController = TextEditingController(text: widget.currentBio);
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _usernameController.dispose();
//     _bioController.dispose();
//     super.dispose();
//   }

//   void _pickImage() {
//     showModalBottomSheet(
//       context: context,
//       builder: (context) {
//         return SizedBox(
//           height: 200,
//           child: GridView.builder(
//             padding: const EdgeInsets.all(10),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               crossAxisSpacing: 10,
//               mainAxisSpacing: 10,
//             ),
//             itemCount: availableImages.length,
//             itemBuilder: (context, index) {
//               return GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     _profileImage = availableImages[index];
//                   });
//                   Navigator.pop(context);
//                 },
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage(availableImages[index]),
//                 ),
//               );
//             },
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('แก้ไขโปรไฟล์', style: TextStyle(color: Colors.white)),
//         iconTheme: const IconThemeData(color: Colors.white),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, {
//                 'name': _nameController.text,
//                 'username': _usernameController.text,
//                 'bio': _bioController.text,
//               });
//             },
//             child: const Text('บันทึก', style: TextStyle(color: Colors.blue, fontSize: 16)),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             Center(
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   CircleAvatar(
//                     radius: 50,
//                     backgroundImage: AssetImage(_profileImage),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: CircleAvatar(
//                       radius: 18,
//                       backgroundColor: Colors.blue,
//                       child: IconButton(
//                         icon: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
//                         onPressed: _pickImage,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),
//             _buildTextField(controller: _nameController, label: 'ชื่อ', icon: Icons.person),
//             const SizedBox(height: 12),
//             _buildTextField(controller: _usernameController, label: 'ชื่อผู้ใช้', icon: Icons.alternate_email),
//             const SizedBox(height: 12),
//             _buildTextField(controller: _bioController, label: 'Bio', icon: Icons.info_outline, maxLines: 3),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     int maxLines = 1,
//   }) {
//     return TextField(
//       controller: controller,
//       maxLines: maxLines,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.grey),
//         prefixIcon: Icon(icon, color: Colors.blue),
//         filled: true,
//         fillColor: Colors.grey[900],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.blue, width: 1.5),
//         ),
//       ),
//     );
//   }
// }





// import 'package:flutter/material.dart';

// class EditProfileScreen extends StatefulWidget {
//   final String currentName;
//   final String currentUsername;
//   final String currentBio;

//   const EditProfileScreen({
//     super.key,
//     required this.currentName,
//     required this.currentUsername,
//     required this.currentBio,
//   });

//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   late TextEditingController _nameController;
//   late TextEditingController _usernameController;
//   late TextEditingController _bioController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.currentName);
//     _usernameController = TextEditingController(text: widget.currentUsername);
//     _bioController = TextEditingController(text: widget.currentBio);
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _usernameController.dispose();
//     _bioController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: const Text('แก้ไขโปรไฟล์', style: TextStyle(color: Colors.white)),
//         iconTheme: const IconThemeData(color: Colors.white),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context, {
//                 'name': _nameController.text,
//                 'username': _usernameController.text,
//                 'bio': _bioController.text,
//               });
//             },
//             child: const Text('บันทึก', style: TextStyle(color: Colors.blue, fontSize: 16)),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             Center(
//               child: Stack(
//                 alignment: Alignment.center,
//                 children: [
//                   const CircleAvatar(
//                     radius: 50,
//                     backgroundImage: AssetImage('assets/images/profile.jpg'),
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: CircleAvatar(
//                       radius: 18,
//                       backgroundColor: Colors.blue,
//                       child: IconButton(
//                         icon: const Icon(Icons.camera_alt, color: Colors.white, size: 18),
//                         onPressed: () {
//                           // TODO: ฟังก์ชันเปลี่ยนรูปโปรไฟล์
//                         },
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 24),

//             // 🔹 ช่องกรอก "ชื่อ"
//             _buildTextField(
//               controller: _nameController,
//               label: 'ชื่อ',
//               icon: Icons.person,
//             ),
//             const SizedBox(height: 12),

//             // 🔹 ช่องกรอก "ชื่อผู้ใช้"
//             _buildTextField(
//               controller: _usernameController,
//               label: 'ชื่อผู้ใช้',
//               icon: Icons.alternate_email,
//             ),
//             const SizedBox(height: 12),

//             // 🔹 ช่องกรอก "Bio"
//             _buildTextField(
//               controller: _bioController,
//               label: 'Bio',
//               icon: Icons.info_outline,
//               maxLines: 3,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ✅ ฟังก์ชันสร้าง TextField ที่มีสไตล์
//   Widget _buildTextField({
//     required TextEditingController controller,
//     required String label,
//     required IconData icon,
//     int maxLines = 1,
//   }) {
//     return TextField(
//       controller: controller,
//       maxLines: maxLines,
//       style: const TextStyle(color: Colors.white),
//       decoration: InputDecoration(
//         labelText: label,
//         labelStyle: const TextStyle(color: Colors.grey),
//         prefixIcon: Icon(icon, color: Colors.blue),
//         filled: true,
//         fillColor: Colors.grey[900],
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: BorderSide.none,
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(12),
//           borderSide: const BorderSide(color: Colors.blue, width: 1.5),
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// class EditProfileScreen extends StatefulWidget {
//   final String currentName;
//   final String currentUsername;
//   final String currentBio;

//   const EditProfileScreen({
//     Key? key,
//     required this.currentName,
//     required this.currentUsername,
//     required this.currentBio,
//   }) : super(key: key);

//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   late TextEditingController _nameController;
//   late TextEditingController _usernameController;
//   late TextEditingController _bioController;

//   @override
//   void initState() {
//     super.initState();
//     _nameController = TextEditingController(text: widget.currentName);
//     _usernameController = TextEditingController(text: widget.currentUsername);
//     _bioController = TextEditingController(text: widget.currentBio);
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _usernameController.dispose();
//     _bioController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Edit Profile'),
//         actions: [
//           TextButton(
//             onPressed: () {
//               // ✅ ส่งค่าที่อัปเดตกลับไปหน้า Profile
//               Navigator.pop(context, {
//                 'name': _nameController.text,
//                 'username': _usernameController.text,
//                 'bio': _bioController.text,
//               });
//             },
//             child: const Text('Save', style: TextStyle(color: Colors.blue)),
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _nameController,
//               decoration: const InputDecoration(labelText: 'Name'),
//             ),
//             TextField(
//               controller: _usernameController,
//               decoration: const InputDecoration(labelText: 'Username'),
//             ),
//             TextField(
//               controller: _bioController,
//               decoration: const InputDecoration(labelText: 'Bio'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// class EditProfileScreen extends StatefulWidget {
//   final String name;
//   final String username;
//   final String bio;

//   const EditProfileScreen({
//     super.key,
//     required this.name,
//     required this.username,
//     required this.bio,
//   });

//   @override
//   _EditProfileScreenState createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   late TextEditingController nameController;
//   late TextEditingController usernameController;
//   late TextEditingController bioController;

//   @override
//   void initState() {
//     super.initState();
//     nameController = TextEditingController(text: widget.name);
//     usernameController = TextEditingController(text: widget.username);
//     bioController = TextEditingController(text: widget.bio);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Edit Profile', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.black,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: nameController,
//               style: TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 labelText: 'Name',
//                 labelStyle: TextStyle(color: Colors.grey),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             TextField(
//               controller: usernameController,
//               style: TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 labelText: 'Username',
//                 labelStyle: TextStyle(color: Colors.grey),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),
//             TextField(
//               controller: bioController,
//               style: TextStyle(color: Colors.white),
//               decoration: InputDecoration(
//                 labelText: 'Bio',
//                 labelStyle: TextStyle(color: Colors.grey),
//                 enabledBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.grey),
//                 ),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
//               onPressed: () {
//                 Navigator.pop(context, {
//                   'name': nameController.text,
//                   'username': usernameController.text,
//                   'bio': bioController.text,
//                 });
//               },
//               child: const Text('Save', style: TextStyle(color: Colors.white)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
