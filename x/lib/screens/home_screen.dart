import 'package:flutter/material.dart';
import 'data.dart';
import 'new_post_screen.dart'; // นำเข้าไฟล์หน้าเพิ่มโพสต์
import 'comment_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _navigateToAddPostScreen() async {
    final newPost = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewPostScreen()),
    );

    if (newPost != null) {
      setState(() {
        tweets.insert(0, newPost); // เพิ่มโพสต์ใหม่ไปยังลำดับแรก
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: ListView.builder(
        itemCount: tweets.length,
        itemBuilder: (context, index) {
          final tweet = tweets[index];
          bool isLiked = tweet['isLiked'] as bool;
          int likeCount = tweet['likes'] as int;

          return Card(
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    leading: CircleAvatar(child: Text(tweet['username'][0])),
                    title: Text(tweet['username']),
                    subtitle: Text(tweet['content']),
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
                              icon: Icon(Icons.favorite, color: isLiked ? Colors.red : Colors.grey),
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
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.comment),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CommentScreen(tweetIndex: index),
                                  ),
                                );
                              },
                            ),
                            Text("${tweet['comments'].length}"),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddPostScreen,
        child: Icon(Icons.add),
      ),
    );
  }
}
