import 'package:flutter/material.dart';
import 'package:x/screens/data.dart';
import 'comment_screen.dart';
import 'image_slider.dart';

class HomePage extends StatefulWidget {
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
        List<String> images = tweet['images'] ?? []; // ดึงรายการภาพ

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
                
                if (images.isNotEmpty) // แสดงสไลด์ภาพถ้ามีภาพ
                  ImageSlider(imageUrls: images),

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
                                  builder: (context) => CommentScreen(tweetIndex: index),
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
