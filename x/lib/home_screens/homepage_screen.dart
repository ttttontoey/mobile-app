import 'package:flutter/material.dart';
import 'package:x/home_screens/data.dart';
import 'comment_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

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
                    backgroundImage: AssetImage(tweet['profilePicture'] ??
                        'assets/images/default_profile.jpg'), // Use profile picture of the tweet creator
                  ),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(tweet['username']),
                      Text('@${tweet['handle']}',
                          style: TextStyle(color: Colors.grey, fontSize: 14))
                    ],
                  ),
                  subtitle: Text(tweet['content']),
                ),
                if (images.isNotEmpty) // แสดงสไลด์ภาพถ้ามีภาพ
                  SizedBox(
                    width: double.infinity, // ทำให้รูปภาพใช้ความกว้างเต็มที่
                    child: Image.network(
                      images[
                          0], // หรือจะใช้ Image.asset ถ้าคุณใช้ภาพในโปรเจ็กต์
                      width: 300, // กำหนดความกว้างของรูปภาพให้ฟิค
                      fit: BoxFit
                          .cover, // ทำให้ภาพไม่บิดเบี้ยว โดยครอบภาพให้พอดีกับขนาด
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
                                  builder: (context) =>
                                      CommentScreen(tweetIndex: index),
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
