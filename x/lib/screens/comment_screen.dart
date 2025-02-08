import 'package:flutter/material.dart';
import 'package:x/screens/data.dart';
import '../constants/colors.dart';
import 'image_slider.dart';

class CommentScreen extends StatefulWidget {
  final int tweetIndex;

  CommentScreen({required this.tweetIndex});

  @override
  _CommentScreenState createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();

  void _addComment() {
    if (_commentController.text.isNotEmpty) {
      setState(() {
        tweets[widget.tweetIndex]['comments'].add({
          'username': 'Me', // หรือสามารถใช้ข้อมูลผู้ใช้จริงได้
          'comment': _commentController.text,
        });
        _commentController.clear(); // ล้าง TextField หลังจากส่งคอมเมนต์
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final tweet = tweets[widget.tweetIndex];
    List<String> images = tweet['images'] ?? []; // ดึงภาพที่เกี่ยวข้อง

    return Scaffold(
      backgroundColor: bg_colors,
      appBar: AppBar(
        title: Text("โพส",
            style: TextStyle(color: text_colors)), // เปลี่ยนสีข้อความใน AppBar
        centerTitle: true,
        backgroundColor: bg_colors,
        foregroundColor: text_colors,
      ),
      body: Column(
        children: [
          // ใช้ SingleChildScrollView สำหรับส่วนของโพสต์และคอมเมนต์
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(child: Text(tweet['username'][0])),
                    title: Text(tweet['username'],
                        style:
                            TextStyle(color: text_colors)), // เปลี่ยนสีข้อความ
                    subtitle: Text(tweet['content'],
                        style:
                            TextStyle(color: text_colors)), // เปลี่ยนสีข้อความ
                  ),

                  if (images.isNotEmpty) // แสดงสไลด์ภาพถ้ามีภาพ
                    ImageSlider(imageUrls: images),

                  // ใช้ ListView.builder สำหรับการแสดงคอมเมนต์
                  ListView.builder(
                    shrinkWrap: true, // ป้องกันการขยายของ ListView
                    physics:
                        NeverScrollableScrollPhysics(), // ปิดการเลื่อนภายใน ListView นี้
                    itemCount: tweet['comments'].length,
                    itemBuilder: (context, index) {
                      final comment = tweet['comments'][index];
                      return ListTile(
                        leading:
                            CircleAvatar(child: Text(comment['username'][0])),
                        title: Text(comment['username'],
                            style: TextStyle(
                                color: text_colors)), // เปลี่ยนสีข้อความ
                        subtitle: Text(comment['comment'],
                            style: TextStyle(
                                color: text_colors)), // เปลี่ยนสีข้อความ
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // ช่องกรอกคอมเมนต์คงที่อยู่ที่ด้านล่างสุด
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _commentController,
                    style: TextStyle(
                        color:
                            text_colors), // เปลี่ยนสีข้อความในช่องกรอกคอมเมนต์
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      hintStyle: TextStyle(
                          color:
                              text_colors.withOpacity(0.6)), // สีข้อความ hint
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send, color: text_colors), // ปรับสีไอคอนส่ง
                  onPressed: _addComment, // เมื่อกดปุ่มส่งจะเพิ่มคอมเมนต์
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
