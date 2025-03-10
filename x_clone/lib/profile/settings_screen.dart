import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Settings', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.person, color: Colors.white),
                  title: Text('Account', style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: Icon(Icons.lock, color: Colors.white),
                  title: Text('Privacy', style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: Icon(Icons.notifications, color: Colors.white),
                  title: Text('Notifications', style: TextStyle(color: Colors.white)),
                ),
                ListTile(
                  leading: Icon(Icons.info, color: Colors.white),
                  title: Text('About', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // นำทางไปยังหน้า Sign In และล้าง Stack หน้าก่อนหน้า
                  Navigator.pushReplacementNamed(context, '/signin');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Sign Out',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}







// import 'package:flutter/material.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Settings', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white), // เปลี่ยนเป็นสีขาว
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ListView(
//         children: const [
//           ListTile(
//             leading: Icon(Icons.person, color: Colors.white),
//             title: Text('Account', style: TextStyle(color: Colors.white)),
//           ),
//           ListTile(
//             leading: Icon(Icons.lock, color: Colors.white),
//             title: Text('Privacy', style: TextStyle(color: Colors.white)),
//           ),
//           ListTile(
//             leading: Icon(Icons.notifications, color: Colors.white),
//             title: Text('Notifications', style: TextStyle(color: Colors.white)),
//           ),
//           ListTile(
//             leading: Icon(Icons.info, color: Colors.white),
//             title: Text('About', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Settings', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//         backgroundColor: Colors.black,
//       ),
//       body: ListView(
//         children: const [
//           ListTile(
//             leading: Icon(Icons.person, color: Colors.white),
//             title: Text('Account', style: TextStyle(color: Colors.white)),
//           ),
//           ListTile(
//             leading: Icon(Icons.lock, color: Colors.white),
//             title: Text('Privacy', style: TextStyle(color: Colors.white)),
//           ),
//           ListTile(
//             leading: Icon(Icons.notifications, color: Colors.white),
//             title: Text('Notifications', style: TextStyle(color: Colors.white)),
//           ),
//           ListTile(
//             leading: Icon(Icons.info, color: Colors.white),
//             title: Text('About', style: TextStyle(color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }
// }
