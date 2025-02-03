class PostData {
  final String profileImage;
  final String username;
  final String timeAgo;
  final String caption;
  final String postImage;
  int likes;
  int comments;
  int shares;
  final String bio;

  PostData({
    required this.profileImage,
    required this.username,
    required this.timeAgo,
    required this.caption,
    required this.postImage,
    this.likes = 0,
    this.comments = 0,
    this.shares = 0,
    required this.bio, // เพิ่มใน constructor
  });
}

List<PostData> posts = [
  PostData(
    profileImage: 'https://your-profile-image-url.com/profile1.jpg',
    username: 'ช่างแม่ง 🐰🏳️‍🌈',
    timeAgo: '10 ชม.',
    caption: '📌 สิ่งที่ควรแมสและโลกควรได้เห็น',
    postImage: 'https://your-post-image-url.com/post1.jpg',
    likes: 14500,
    comments: 16700,
    shares: 2100000,
    bio: 'นักพัฒนาที่ชอบเล่นเกมและออกแบบ UI/UX', // เพิ่มข้อมูล bio
  ),
  PostData(
    profileImage: 'https://your-profile-image-url.com/profile2.jpg',
    username: 'User 2',
    timeAgo: '5 ชม.',
    caption: 'โพสต์ที่สอง',
    postImage: 'https://your-post-image-url.com/post2.jpg',
    likes: 5000,
    comments: 8000,
    shares: 1000000,
    bio: 'ผู้ใช้งานทั่วไป', // เพิ่มข้อมูล bio
  ),
];
