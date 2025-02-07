import 'package:flutter/material.dart';
import '../widgets/tweet_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Twitter Clone')),
      body: ListView(
        children: const [
          TweetCard(
            userName: 'John Doe',
            content: 'This is my first tweet! 🚀',
            imageUrl: 'https://via.placeholder.com/150',
          ),
          TweetCard(
            userName: 'Jane Smith',
            content: 'Flutter is amazing! 💙',
            imageUrl: 'https://via.placeholder.com/150',
          ),
        ],
      ),
    );
  }
}
