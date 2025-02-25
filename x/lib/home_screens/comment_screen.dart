// import 'package:flutter/material.dart';
// import 'package:x/screens/data.dart';
// import '../constants/colors.dart';

// class CommentScreen extends StatefulWidget {
//   final int tweetIndex;

//   CommentScreen({required this.tweetIndex});

//   @override
//   _CommentScreenState createState() => _CommentScreenState();
// }

// class _CommentScreenState extends State<CommentScreen> {
//   final TextEditingController _commentController = TextEditingController();

//   void _addComment() {
//     if (_commentController.text.isNotEmpty) {
//       setState(() {
//         tweets[widget.tweetIndex]['comments'].add({
//           'username': 'Me', // หรือสามารถใช้ข้อมูลผู้ใช้จริงได้
//           'comment': _commentController.text,
//         });
//         _commentController.clear(); // ล้าง TextField หลังจากส่งคอมเมนต์
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final tweet = tweets[widget.tweetIndex];
//     List<String> images = tweet['images'] ?? []; // ดึงภาพที่เกี่ยวข้อง

//     return Scaffold(
//       backgroundColor: bg_colors,
//       appBar: AppBar(
//         title: Text("โพส", style: TextStyle(color: text_colors)),
//         centerTitle: true,
//         backgroundColor: bg_colors,
//         foregroundColor: text_colors,
//       ),
//       body: Column(
//         children: [
//           // ใช้ SingleChildScrollView สำหรับส่วนของโพสต์และคอมเมนต์
//           Expanded(
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   // แสดงภาพที่เกี่ยวข้อง
//                   if (images.isNotEmpty) // แสดงสไลด์ภาพถ้ามีภาพ
//                     Container(
//                       margin: EdgeInsets.symmetric(vertical: 10), // เพิ่มระยะห่างระหว่างรูปกับสิ่งอื่นๆ
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10), // กำหนดมุมโค้งให้กับกรอบ
//                         border: Border.all(color: Colors.grey, width: 2), // สีและความหนาของกรอบ
//                       ),
//                       child: Image.network(
//                         images[0], // ใช้ URL ของภาพที่ต้องการแสดง
//                         fit: BoxFit.fitWidth, // ทำให้ความกว้างของภาพพอดีกับหน้าจอ
//                       ),
//                     ),

//                   // แสดงคอมเมนต์
//                   ListView.builder(
//   shrinkWrap: true,
//   physics: NeverScrollableScrollPhysics(),
//   itemCount: tweet['comments'].length,
//   itemBuilder: (context, index) {
//     final comment = tweet['comments'][index]; // Comment data
//     return ListTile(
//       leading: CircleAvatar(
//         backgroundImage: AssetImage(comment['profilePicture'] ?? 'assets/images/default_profile.jpg'), // Use the profile picture
//       ),
//       title: RichText(
//         text: TextSpan(
//           children: [
//             TextSpan(
//               text: comment['username'] ?? 'Unknown',
//               style: TextStyle(color: Colors.white), // Set username text color to white
//             ),
//             TextSpan(
//               text: ' @${comment['username'] ?? 'Unknown'}',
//               style: TextStyle(color: Colors.grey, fontSize: 14),
//             ),
//           ],
//         ),
//       ),
//       subtitle: Text(
//         comment['comment'] ?? 'No comment available',
//         style: TextStyle(color: Colors.white), // Set subtitle text color to white
//       ),
//     );
//   },
// ),


//           // ช่องกรอกคอมเมนต์คงที่อยู่ที่ด้านล่างสุด
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Expanded(
//                   child: TextField(
//                     controller: _commentController,
//                     style: TextStyle(
//                         color: Colors.white), // เปลี่ยนสีข้อความใน TextField
//                     decoration: InputDecoration(
//                       hintText: 'Write a comment...',
//                       hintStyle: TextStyle(
//                           color: Colors.white
//                               .withOpacity(0.6)), // ปรับสีของ hint text
//                       filled: true,
//                       fillColor: Colors.black
//                           .withOpacity(0.6), // เปลี่ยนสีพื้นหลังของ TextField
//                       border: OutlineInputBorder(
//                         borderSide: BorderSide(color: Colors.white), // สีของขอบ
//                       ),
//                     ),
//                   ),
//                 ),
//                 IconButton(
//                   icon: Icon(Icons.send, color: text_colors),
//                   onPressed: _addComment,
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//             ),
//           ),
//         ],
//       ),
//       ];
//   }
// }
import 'package:flutter/material.dart';
import 'package:x/home_screens/data.dart';
import '../constants/colors.dart';

class CommentScreen extends StatefulWidget {
  final int tweetIndex;

  const CommentScreen({super.key, required this.tweetIndex});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        tweets[widget.tweetIndex]['comments'].add({
          'username': 'Me', // You can use actual user data here
          'comment': _commentController.text,
          'profilePicture': 'assets/images/default_profile.jpg', // Default profile picture or dynamic one
        });
        _commentController.clear(); // Clear the TextField after submitting
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tweet = tweets[widget.tweetIndex];
    List<String> images = tweet['images'] ?? []; // Get related images for the tweet

    return Scaffold(
      backgroundColor: bg_colors,
      appBar: AppBar(
        title: Text("โพส", style: TextStyle(color: text_colors)),
        centerTitle: true,
        backgroundColor: bg_colors,
        foregroundColor: text_colors,
      ),
      body: Column(
        children: [
          // Use SingleChildScrollView for the post and comments sections
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Display related images (if available)
                  if (images.isNotEmpty) // Show image slider if there are images
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10), // Add margin between image and other content
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // Rounded corners for the border
                        border: Border.all(color: Colors.grey, width: 2), // Border color and width
                      ),
                      child: Image.network(
                        images[0], // Use URL of the image to display
                        fit: BoxFit.fitWidth, // Ensure the image fits the width
                      ),
                    ),

                  // Display comments
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: tweet['comments'].length,
                    itemBuilder: (context, index) {
                      final comment = tweet['comments'][index]; // Comment data

                      return ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(comment['profilePicture'] ?? 'assets/images/default_profile.jpg'), // Use profile picture from the comment
                        ),
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: comment['username'] ?? 'Unknown',
                                style: TextStyle(color: Colors.white), // Set username text color to white
                              ),
                              TextSpan(
                                text: ' @${comment['username'] ?? 'Unknown'}',
                                style: TextStyle(color: Colors.grey, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                        subtitle: Text(
                          comment['comment'] ?? 'No comment available',
                          style: TextStyle(color: Colors.white), // Set subtitle text color to white
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Comment input field at the bottom
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    style: TextStyle(color: Colors.white), // Change text color in TextField
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)), // Change hint text color
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.6), // Change background color of TextField
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // Border color of TextField
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: text_colors),
                  onPressed: _addComment,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
