import 'package:flutter/widgets.dart';

List<Map<String, dynamic>> tweets = [
  // post1
  {
    'username': 'กลิ่นหนังสือ',
    'handle': 'klinnangsue',
    'content': 'ใชีชีวิตให้ง่าย อย่าไปคิดมาก',
    'profilePicture': 'assets/images/klinnangsue.jpg',
    'likes': 10,
    'comments': [
      {
        'profilePicture': 'assets/images/post1.jpg',
        'username': 'User2',
        'comment': 'Great tweet!'
      },
      {
        'profilePicture': 'assets/images/post1.jpg',
        'username': 'User3',
        'comment': 'Nice one!'
      }
    ],
    'isLiked': false,
    'images': [
      'assets/images/post1.jpg',
    ],
  },
  // post2
  {
    'username': 'ช่างแม่ง',
    'handle': 'psmark1821',
    'content': 'ที่ไม่พูดไม่ได้แปลว่าไม่คิด',
    'profilePicture': 'assets/images/psm_profile.jpg',
    'likes': 10,
    'comments': [
      {
        'profilePicture': 'assets/images/profile_Blank.jpg',
        'username': 'User2',
        'comment': 'Great tweet!'
      },
      {
        'profilePicture': 'assets/images/profile_Blank.jpg',
        'username': 'User3',
        'comment': 'Nice one!'
      }
    ],
    'isLiked': false,
    'images': [
      'assets/images/post2.jpg',
    ],
  },
  // post3
  {
    'username': 'โหยกระแส',
    'handle': 'HoKrasae',
    'content': 'เราทั้งคู่ยังเป็นคนเดิม ความรักยังอยู่ที่เดิม แต่มุมมอง มองกันไม่เหมือนเดิม',
    'profilePicture': 'assets/images/profile_Hoi.jpg',
    'likes': 1000,
    'comments': [
      {
        'profilePicture': 'assets/images/profile_Blank.jpg',
        'username': 'User2',
        'comment': 'Great tweet!'
      },
      {
        'profilePicture': 'assets/images/profile_Blank.jpg',
        'username': 'User3',
        'comment': 'Nice one!'
      }
    ],
    'isLiked': false,
    'images': [
      'assets/images/Post_hoi.jpg',
    ],
  },
  // post4
  {
    'username': 'ช่างแม่ง',
    'handle': 'psmark1821',
    'content': '24/7ค้าบบบ',
    'profilePicture': 'assets/images/psm_profile.jpg',
    'likes': 10,
    'comments': [
      {
        'profilePicture': 'assets/images/profile_Blank.jpg',
        'username': 'User2',
        'comment': 'Great tweet!'
      },
      {
        'profilePicture': 'assets/images/profile_Blank.jpg',
        'username': 'User3',
        'comment': 'Nice one!'
      }
    ],
    'isLiked': false,
    'images': [
      'assets/images/post3.jpg',
    ],
  },
];

// ✅ Toggle Like Function
void toggleLike(int index) {
  tweets[index]['isLiked'] = !tweets[index]['isLiked'];
  tweets[index]['likes'] += tweets[index]['isLiked'] ? 1 : -1;
}

// ✅ Add Comment Function
void addComment(int index, String username, String profilePicture, String comment) {
  if (comment.isNotEmpty) {
    tweets[index]['comments'].add({
      'username': username,
      'profilePicture': profilePicture,
      'comment': comment,
    });
  }
}

// ✅ Widget for displaying images with custom size
Widget buildImage(String imageUrl) {
  return Image.asset(
    imageUrl, // แก้เป็น Image.asset เพราะใช้ assets ภายในแอป
    width: 200, // Set width of image
    height: 150, // Set height of image
    fit: BoxFit.contain, // Ensure the image covers the space
  );
}





// import 'package:flutter/widgets.dart';

// List<Map<String, dynamic>> tweets = [
//   //post1
//   {
//     'username': 'กลิ่นหนังสือ',
//     'handle': 'klinnangsue',
//     'content': 'ใชีชีวิตให้ง่าย อย่าไปคิดมาก',
//     'profilePicture': 'assets/images/klinnangsue.jpg',
//     'likes': 10,
//     'comments': [
//       {
//         'profilePicture': 'assets/images/post1.jpg',
//         'username': 'User2',
//         'comment': 'Great tweet!'
//       },
//       {
//         'profilePicture': 'assets/images/post1.jpg',
//         'username': 'User3',
//         'comment': 'Nice one!'
//       }
//     ],
//     'isLiked': false,
//     'images': [
//       'assets/images/post1.jpg',
//     ],
//   },
//   //post2
//   {
//     'username': 'ช่างแม่ง',
//     'handle': 'psmark1821',
//     'content': 'ที่ไม่พูดไม่ได้แปลว่าไม่คิด',
//     'profilePicture': 'assets/images/psm_profile.jpg',
//     'likes': 10,
//     'comments': [
//       {
//         'profilePicture': 'assets/images/profile_Blank.jpg',
//         'username': 'User2',
//         'comment': 'Great tweet!'
//       },
//       {
//         'profilePicture': 'assets/images/profile_Blank.jpg',
//         'username': 'User3',
//         'comment': 'Nice one!'
//       }
//     ],
//     'isLiked': false,
//     'images': [
//       'assets/images/post2.jpg',
//     ],
//   },
//   //post3
//   {
//     'username': 'โหยกระแส',
//     'handle': 'HoKrasae',
//     'content': 'เราทั้งคู่ยังเป็นคนเดิม ความรักยังอยู่ที่เดิม แต่มุมมอง มองกันไม่เหมือนเดิม',
//     'profilePicture': 'assets/images/profile_Hoi.jpg',
//     'likes': 1000,
//     'comments': [
//       {
//         'profilePicture': 'assets/images/profile_Blank.jpg',
//         'username': 'User2',
//         'comment': 'Great tweet!'
//       },
//       {
//         'profilePicture': 'assets/images/profile_Blank.jpg',
//         'username': 'User3',
//         'comment': 'Nice one!'
//       }
//     ],
//     'isLiked': false,
//     'images': [
//       'assets/images/Post_hoi.jpg',
//     ],
//   },
//   //post4
//   {
//     'username': 'ช่างแม่ง',
//     'handle': 'psmark1821',
//     'content': '24/7ค้าบบบ',
//     'profilePicture': 'assets/images/psm_profile.jpg',
//     'likes': 10,
//     'comments': [
//       {
//         'profilePicture': 'assets/images/profile_Blank.jpg',
//         'username': 'User2',
//         'comment': 'Great tweet!'
//       },
//       {
//         'profilePicture': 'assets/images/profile_Blank.jpg',
//         'username': 'User3',
//         'comment': 'Nice one!'
//       }
//     ],
//     'isLiked': false,
//     'images': [
//       'assets/images/post3.jpg',
//     ],
//   },
// ];
// // Toggle like status and adjust like count
// void toggleLike(int index) {
//   tweets[index]['isLiked'] = !tweets[index]['isLiked'];
//   tweets[index]['likes'] += tweets[index]['isLiked'] ? 1 : -1;
// }

// // Add comment to tweet
// void addComment(int index, String comment) {
//   if (comment.isNotEmpty) {
//     tweets[index]['comments'].add({'username': 'User', 'comment': comment});
//   }
// }

// // Example widget for displaying images with custom size
// Widget buildImage(String imageUrl) {
//   return Image.network(
//     imageUrl,
//     width: 200, // Set width of image
//     height: 150, // Set height of image
//     fit: BoxFit.contain, // Ensure the image covers the space
//   );
// }
