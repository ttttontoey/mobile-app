import 'package:flutter/material.dart';
import 'comment_screen.dart';

class HomePage extends StatefulWidget {
  final String currentUsername;
  final String currentHandle;
  final List<Map<String, dynamic>> posts; // รับโพสต์ทั้งหมด

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
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.posts.length, // ✅ ใช้ posts จาก widget
      itemBuilder: (context, index) {
        final tweet = widget.posts[index];
        bool isLiked = tweet['isLiked'] as bool;
        int likeCount = tweet['likes'] as int;
        List<String> images = (tweet['images'] as List<dynamic>).cast<String>();

        return Card(
          margin: EdgeInsets.all(10),
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
                      Text(tweet['username']), // ✅ ใช้ชื่อจากโพสต์
                      Text('@${tweet['handle']}', style: TextStyle(color: Colors.grey, fontSize: 14)),
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
                    border: Border(top: BorderSide(color: Colors.grey.shade300)),
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

