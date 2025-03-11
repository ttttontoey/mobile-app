import 'package:flutter/material.dart';
import 'comment_screen.dart';
import 'dart:typed_data'; // สำหรับ Uint8List

class HomePage extends StatefulWidget {
  final String currentUsername;
  final String currentHandle;
  final List<Map<String, dynamic>> posts;

  const HomePage({
    super.key,
    required this.currentUsername,
    required this.currentHandle,
    required this.posts,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ฟังก์ชันสำหรับแสดงรูปภาพตามประเภทของข้อมูล
  Widget buildPostImage(dynamic imageData) {
    if (imageData is Uint8List) {
      return Image.memory(
        imageData,
        width: 300,
        fit: BoxFit.cover,
      );
    } else if (imageData is String) {
      if (imageData.startsWith('http')) {
        return Image.network(
          imageData,
          width: 300,
          fit: BoxFit.cover,
        );
      } else {
        return Image.asset(
          imageData,
          width: 300,
          fit: BoxFit.cover,
        );
      }
    } else {
      return const SizedBox(); // ไม่มีภาพ
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.posts.length,
      itemBuilder: (context, index) {
        final tweet = widget.posts[index];
        bool isLiked = tweet['isLiked'] as bool;
        int likeCount = tweet['likes'] as int;
        List<dynamic> images = tweet['images'] as List<dynamic>;

        return Card(
          margin: const EdgeInsets.all(10),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                      Text(tweet['username']),
                      Text('@${tweet['handle']}', style: const TextStyle(color: Colors.grey, fontSize: 14)),
                    ],
                  ),
                  subtitle: Text(tweet['content']),
                ),
                if (images.isNotEmpty)
                  SizedBox(
                    width: double.infinity,
                    child: buildPostImage(images[0]), // ใช้ฟังก์ชันแสดงรูปภาพ
                  ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Colors.grey.shade300)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.comment),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CommentScreen(
                                    tweetIndex: index,
                                    currentUsername: widget.currentUsername,
                                    currentHandle: widget.currentHandle,
                                    profilePicture: 'assets/images/post4.jpg',
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
                        icon: const Icon(Icons.share),
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
