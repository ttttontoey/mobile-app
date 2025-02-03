import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:myapp/post_data/post_data.dart'; // import สำหรับ PostData
import 'package:photo_view/photo_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("เอ็ก"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostCard(post: posts[index]);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.blue,
        unselectedItemColor: const Color.fromARGB(255, 154, 152, 152),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'ค้นหา',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'แจ้งเตือน',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'โปรไฟล์',
          ),
        ],
      ),
    );
  }
}

class PostCard extends StatefulWidget {
  final PostData post;

  const PostCard({super.key, required this.post});

  @override
  _PostCardState createState() => _PostCardState();
}

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
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenImage(imageUrl: widget.post.postImage),
              ),
            );
          },
          child: CachedNetworkImage(
            imageUrl: widget.post.postImage,
            placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error, color: Colors.red),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.post.caption,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.favorite, color: Colors.red),
              onPressed: _incrementLikes,
            ),
            Text("${widget.post.likes}", style: const TextStyle(color: Colors.white)),
            IconButton(
              icon: const Icon(Icons.comment, color: Colors.white),
              onPressed: _incrementComments,
            ),
            Text("${widget.post.comments}", style: const TextStyle(color: Colors.white)),
            IconButton(
              icon: const Icon(Icons.share, color: Colors.blue),
              onPressed: _incrementShares,
            ),
            Text("${widget.post.shares}", style: const TextStyle(color: Colors.white)),
          ],
        ),
        const Divider(color: Colors.grey),
      ],
    );
  }
}

class FullScreenImage extends StatelessWidget {
  final String imageUrl;

  const FullScreenImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: PhotoView(
          imageProvider: CachedNetworkImageProvider(imageUrl),
        ),
      ),
    );
  }
}

class ProfileMockupScreen extends StatelessWidget {
  final PostData post;

  const ProfileMockupScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("โปรไฟล์"),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(post.profileImage),
              radius: 50,
            ),
            const SizedBox(height: 20),
            Text(
              post.username,
              style: const TextStyle(color: Colors.white, fontSize: 24),
            ),
            const SizedBox(height: 10),
            Text(
              post.caption, // ใช้ caption แทน bio
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: Colors.black,
                      title: const Text(
                        "ข้อมูลโปรไฟล์",
                        style: TextStyle(color: Colors.white),
                      ),
                      content: Text(
                        "ชื่อ: ${post.username}\nเวลาโพสต์: ${post.timeAgo}\nคำบรรยาย: ${post.caption}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: const Text(
                            'ปิด',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text(
                'แสดงข้อมูลโปรไฟล์',
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
