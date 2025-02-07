import '../models/tweet_model.dart';

class TweetService {
  static List<Tweet> getTweets() {
    return [
      Tweet(
        userName: 'John Doe',
        content: 'Hello Twitter!',
        imageUrl: 'https://via.placeholder.com/150',
      ),
      Tweet(
        userName: 'Jane Doe',
        content: 'Flutter is amazing!',
        imageUrl: 'https://via.placeholder.com/150',
      ),
    ];
  }
}
