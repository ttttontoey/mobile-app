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
  },
  {
    'username': 'User2',
    'content': 'Hello world!',
    'likes': 5,
    'comments': [
      {'username': 'User1', 'comment': 'Love this!'}
    ],
    'isLiked': false,
  },
];



void toggleLike(int index) {
  tweets[index]['liked'] = !tweets[index]['liked'];
  tweets[index]['likes'] += tweets[index]['liked'] ? 1 : -1;
}

void addComment(int index, String comment) {
  if (comment.isNotEmpty) {
    tweets[index]['comments'].add(comment);
  }
}
