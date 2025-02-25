import 'package:flutter/material.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  void _submitPost() {
    if (_usernameController.text.isNotEmpty && _contentController.text.isNotEmpty) {
      final newPost = {
        'username': _usernameController.text.trim(),
        'content': _contentController.text.trim(),
        'likes': 0,
        'comments': [],
        'isLiked': false,
      };

      Navigator.pop(context, newPost); // ส่งค่ากลับไปที่หน้า Home
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New Post')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _contentController,
              decoration: InputDecoration(labelText: 'What\'s on your mind?'),
              maxLines: 3,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitPost,
              child: Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}
