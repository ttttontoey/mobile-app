import 'package:flutter/material.dart';
import '../screens/tweet_screen.dart';

class TweetCard extends StatelessWidget {
  final String userName;
  final String content;
  final String imageUrl;

  const TweetCard({
    super.key,
    required this.userName,
    required this.content,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(imageUrl)),
        title: Text(userName, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(content, maxLines: 2, overflow: TextOverflow.ellipsis),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TweetScreen(
                userName: userName,
                content: content,
                imageUrl: imageUrl,
              ),
            ),
          );
        },
      ),
    );
  }
}
