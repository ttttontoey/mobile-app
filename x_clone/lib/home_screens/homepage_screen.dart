import 'package:flutter/material.dart';
import 'package:x/home_screens/data.dart'; // ✅ ใช้ tweets จากไฟล์ data.dart
import 'comment_screen.dart';

class HomePage extends StatefulWidget {
  final String currentUsername;
  final String currentHandle;

  const HomePage({
    super.key,
    required this.currentUsername,
    required this.currentHandle,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tweets.length,
      itemBuilder: (context, index) {
        final tweet = tweets[index];
        bool isLiked = tweet['isLiked'] as bool;
        int likeCount = tweet['likes'] as int;
        List<String> images = (tweet['images'] as List<dynamic>)
            .cast<String>(); // ✅ แปลงให้เป็น List<String>

        return Card(
          margin: EdgeInsets.all(10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: const Color.fromARGB(255, 235, 235, 235),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                      tweet['profilePicture'] ?? 'assets/images/post4.jpg',
                    ),
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.currentUsername), // ✅ ใช้ currentUsername
                      Text(widget.currentHandle,
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ],
                  ),
                  subtitle: Text(tweet['content']),
                ),
                if (images.isNotEmpty)
                  SizedBox(
                    width: double.infinity,
                    child: Image.network(
                      images[0],
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border:
                        Border(top: BorderSide(color: Colors.grey.shade300)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.comment),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CommentScreen(
                                    tweetIndex: index,
                                    currentUsername: widget.currentUsername,
                                    currentHandle: widget.currentHandle,
                                    profilePicture:
                                        'assets/images/default_profile.jpg', // ส่งภาพโปรไฟล์ที่ต้องการ
                                  ),
                                ),
                              );
                            },
                          ),
                          Text("${tweet['comments'].length}"),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.favorite,
                                color: isLiked ? Colors.red : Colors.grey),
                            onPressed: () {
                              setState(() {
                                isLiked = !isLiked;
                                tweet['isLiked'] = isLiked;
                                tweet['likes'] += isLiked ? 1 : -1;
                              });
                            },
                          ),
                          Text("$likeCount"),
                        ],
                      ),
                      IconButton(
                        icon: Icon(Icons.share),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:x/home_screens/data.dart'; // ✅ ใช้ tweets จากไฟล์ data.dart
// import 'comment_screen.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: tweets.length,
//       itemBuilder: (context, index) {
//         final tweet = tweets[index];
//         bool isLiked = tweet['isLiked'] as bool;
//         int likeCount = tweet['likes'] as int;
//         List<String> images = (tweet['images'] as List<dynamic>).cast<String>(); // ✅ แปลงให้เป็น List<String>

//         return Card(
//           margin: EdgeInsets.all(10),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           color: const Color.fromARGB(255, 235, 235, 235),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage: AssetImage(tweet['profilePicture'] ??
//                         'assets/images/post4.jpg'), // Use profile picture of the tweet creator
//                   ),
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(tweet['username']),
//                       Text('@${tweet['handle']}',
//                           style: TextStyle(color: Colors.grey, fontSize: 14))
//                     ],
//                   ),
//                   subtitle: Text(tweet['content']),
//                 ),
//                 if (images.isNotEmpty) // แสดงสไลด์ภาพถ้ามีภาพ
//                   SizedBox(
//                     width: double.infinity, // ทำให้รูปภาพใช้ความกว้างเต็มที่
//                     child: Image.network(
//                       images[
//                           0], // หรือจะใช้ Image.asset ถ้าคุณใช้ภาพในโปรเจ็กต์
//                       width: 300, // กำหนดความกว้างของรูปภาพให้ฟิค
//                       fit: BoxFit
//                           .cover, // ทำให้ภาพไม่บิดเบี้ยว โดยครอบภาพให้พอดีกับขนาด
//                     ),
//                   ),
//                 Container(
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   decoration: BoxDecoration(
//                     border:
//                         Border(top: BorderSide(color: Colors.grey.shade300)),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.comment),
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       CommentScreen(tweetIndex: index),
//                                 ),
//                               );
//                             },
//                           ),
//                           Text("${tweet['comments'].length}"),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.favorite,
//                                 color: isLiked ? Colors.red : Colors.grey),
//                             onPressed: () {
//                               setState(() {
//                                 isLiked = !isLiked;
//                                 tweet['isLiked'] = isLiked;
//                                 tweet['likes'] += isLiked ? 1 : -1;
//                               });
//                             },
//                           ),
//                           Text("$likeCount"),
//                         ],
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.share),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }








// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   final List<Map<String, dynamic>> tweets;
//   const HomePage({super.key, required this.tweets});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: widget.tweets.length,
//       itemBuilder: (context, index) {
//         final tweet = widget.tweets[index];
//         bool isLiked = tweet['isLiked'] as bool;
//         int likeCount = tweet['likes'] as int;
//         List<String> images = (tweet['images'] as List<dynamic>).cast<String>(); // ✅ แปลงให้เป็น List<String>

//         return Card(
//           margin: EdgeInsets.all(10),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           color: Colors.black,
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ListTile(
//                   title: Text(tweet['username'], style: TextStyle(color: Colors.white)),
//                   subtitle: Text(tweet['content'], style: TextStyle(color: Colors.white70)),
//                 ),
//                 if (images.isNotEmpty)
//                   Image.asset(
//                     images[0],
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }














// import 'package:flutter/material.dart';
// import 'package:x/home_screens/data.dart';
// import 'comment_screen.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: tweets.length,
//       itemBuilder: (context, index) {
//         final tweet = tweets[index];
//         bool isLiked = tweet['isLiked'] as bool;
//         int likeCount = tweet['likes'] as int;
//         List<String> images = tweet['images'] ?? []; // ดึงรายการภาพ

//         return Card(
//           margin: EdgeInsets.all(10),
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           color: const Color.fromARGB(255, 235, 235, 235),
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 ListTile(
//                   leading: CircleAvatar(
//                     backgroundImage: AssetImage(tweet['profilePicture'] ??
//                         'assets/images/default_profile.jpg'), // Use profile picture of the tweet creator
//                   ),
//                   title: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(tweet['username']),
//                       Text('@${tweet['handle']}',
//                           style: TextStyle(color: Colors.grey, fontSize: 14))
//                     ],
//                   ),
//                   subtitle: Text(tweet['content']),
//                 ),
//                 if (images.isNotEmpty) // แสดงสไลด์ภาพถ้ามีภาพ
//                   SizedBox(
//                     width: double.infinity, // ทำให้รูปภาพใช้ความกว้างเต็มที่
//                     child: Image.network(
//                       images[
//                           0], // หรือจะใช้ Image.asset ถ้าคุณใช้ภาพในโปรเจ็กต์
//                       width: 300, // กำหนดความกว้างของรูปภาพให้ฟิค
//                       fit: BoxFit
//                           .cover, // ทำให้ภาพไม่บิดเบี้ยว โดยครอบภาพให้พอดีกับขนาด
//                     ),
//                   ),
//                 Container(
//                   padding: EdgeInsets.symmetric(vertical: 8),
//                   decoration: BoxDecoration(
//                     border:
//                         Border(top: BorderSide(color: Colors.grey.shade300)),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.comment),
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       CommentScreen(tweetIndex: index),
//                                 ),
//                               );
//                             },
//                           ),
//                           Text("${tweet['comments'].length}"),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: Icon(Icons.favorite,
//                                 color: isLiked ? Colors.red : Colors.grey),
//                             onPressed: () {
//                               setState(() {
//                                 isLiked = !isLiked;
//                                 tweet['isLiked'] = isLiked;
//                                 tweet['likes'] += isLiked ? 1 : -1;
//                               });
//                             },
//                           ),
//                           Text("$likeCount"),
//                         ],
//                       ),
//                       IconButton(
//                         icon: Icon(Icons.share),
//                         onPressed: () {},
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
