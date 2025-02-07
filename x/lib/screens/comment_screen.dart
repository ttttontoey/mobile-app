import 'package:flutter/material.dart';
import 'data.dart';

class CommentScreen extends StatefulWidget {
  final int tweetIndex;

  CommentScreen({required this.tweetIndex});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final tweet = tweets[widget.tweetIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('โพสต์'),
      ),
      body: Column(
        children: [
          ListTile(
            leading: CircleAvatar(child: Text(tweet['username'][0])),
            title: Text(tweet['username']),
            subtitle: Text(tweet['content']),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tweet['comments'].length,
              itemBuilder: (context, index) {
                final comment = tweet['comments'][index]; // คอมเมนต์เป็น Map
                return ListTile(
                  leading: CircleAvatar(child: Text(comment['username'][0])),
                  title: Text(comment['username']), // แสดงชื่อคนคอมเมนต์
                  subtitle: Text(comment['comment']), // แสดงข้อความคอมเมนต์
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    decoration: InputDecoration(hintText: 'Add a comment'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String newComment = _commentController.text.trim();
                    if (newComment.isNotEmpty) {
                      setState(() {
                        tweets[widget.tweetIndex]['comments'].add({
                          'username': 'ttt.tontoey', // ใส่ชื่อ User จริง ๆ ตรงนี้
                          'comment': newComment,
                        });
                      });
                      _commentController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
