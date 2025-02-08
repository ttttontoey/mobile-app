import 'package:flutter/widgets.dart';

List<Map<String, dynamic>> tweets = [
  {
    'username': 'User1',
    'content': 'This is a tweet!',
    'likes': 10,
    'comments': [
      {'username': 'User2', 'comment': 'Great tweet!'},
      {'username': 'User3', 'comment': 'Nice one!'}
    ],
    'isLiked': false,
    'images': [
      'assets/images/post1.jpg',
      'https://via.placeholder.com/400x300/FF5733/FFFFFF?text=Image+1',
    ],
  },
  {
    'username': 'User2',
    'content': 'Hello world!',
    'likes': 5,
    'comments': [
      {'username': 'User1', 'comment': 'Love this!'}
    ],
    'isLiked': false,
    'images': [
      'https://via.placeholder.com/400x300/3357FF/FFFFFF?text=Image+2',
    ],
  },
];

// Toggle like status and adjust like count
void toggleLike(int index) {
  tweets[index]['isLiked'] = !tweets[index]['isLiked'];
  tweets[index]['likes'] += tweets[index]['isLiked'] ? 1 : -1;
}

// Add comment to tweet
void addComment(int index, String comment) {
  if (comment.isNotEmpty) {
    tweets[index]['comments'].add({'username': 'User', 'comment': comment});
  }
}

// Example widget for displaying images with custom size
Widget buildImage(String imageUrl) {
  return Image.network(
    imageUrl,
    width: 200, // Set width of image
    height: 150, // Set height of image
    fit: BoxFit.contain, // Ensure the image covers the space
  );
}
