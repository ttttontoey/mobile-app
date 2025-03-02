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
          'username': 'Me',
          'comment': _commentController.text,
          'profilePicture': 'assets/images/default_profile.jpg',
        });
        _commentController.clear();
      });
    }
  }

  void _navigateToProfile(String username) {
    Navigator.pushNamed(context, '/profile', arguments: {'username': username});
  }

  @override
  Widget build(BuildContext context) {
    final tweet = tweets[widget.tweetIndex];
    List<String> images = tweet['images'] ?? [];

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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: GestureDetector(
                      onTap: () => _navigateToProfile(tweet['username']),
                      child: CircleAvatar(
                        backgroundImage: AssetImage(tweet['profilePicture'] ?? 'assets/images/default_profile.jpg'),
                      ),
                    ),
                    title: Text(
                      tweet['username'] ?? 'Unknown',
                      style: TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      tweet['content'] ?? '',
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),

                  if (images.isNotEmpty)
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 2),
                      ),
                      child: Image.network(
                        images[0],
                        fit: BoxFit.fitWidth,
                      ),
                    ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: tweet['comments'].length,
                    itemBuilder: (context, index) {
                      final comment = tweet['comments'][index];

                      return ListTile(
                        leading: GestureDetector(
                          onTap: () => _navigateToProfile(comment['username']),
                          child: CircleAvatar(
                            backgroundImage: AssetImage(comment['profilePicture'] ?? 'assets/images/default_profile.jpg'),
                          ),
                        ),
                        title: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: comment['username'] ?? 'Unknown',
                                style: TextStyle(color: Colors.white),
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
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      hintStyle: TextStyle(color: Colors.white.withOpacity(0.6)),
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.6),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
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
