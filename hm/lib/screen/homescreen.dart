// ignore_for_file: unused_element

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main.dart';

class _PostCardState extends State<PostCard> {
  void _incrementLikes() {
    setState(() {
      widget.post.likes++;
    });
  }

  void _incrementComments() {
    setState(() {
      widget.post.comments++;
    });
  }

  void _incrementShares() {
    setState(() {
      widget.post.shares++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileMockupScreen(post: widget.post), // ส่งข้อมูล post
                ),
              );
            },
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(widget.post.profileImage),
            ),
          ),
          title: Text(
            widget.post.username,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            widget.post.timeAgo,
            style: const TextStyle(color: Colors.grey),
          ),
          trailing: const Icon(Icons.more_horiz, color: Colors.white),
        ),
        // ข้อมูลโพสต์อื่นๆ
      ],
    );
  }
}
