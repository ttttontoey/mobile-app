import 'package:flutter/material.dart';

class NewPostScreen extends StatefulWidget {
  final String username;
  final String handle;

  const NewPostScreen({
    super.key,
    required this.username,
    required this.handle,
  });

  @override
  _NewPostScreenState createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final TextEditingController _contentController = TextEditingController();
  List<String> selectedImages = []; // ✅ เก็บรูปที่เลือก

  final List<String> imageAssets = [
    'assets/images/post1.jpg',
    'assets/images/post2.jpg',
    'assets/images/post3.jpg',
    'assets/images/post4.jpg',
  ];

  void _selectImage(String imagePath) {
    setState(() {
      if (!selectedImages.contains(imagePath)) {
        selectedImages.add(imagePath); // ✅ เพิ่มรูปที่เลือก
      }
    });
    Navigator.pop(context);
  }

  void _openImagePicker() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          height: 200,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: imageAssets.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _selectImage(imageAssets[index]),
                child: Image.asset(imageAssets[index], fit: BoxFit.cover),
              );
            },
          ),
        );
      },
    );
  }

  void _submitPost() {
    if (_contentController.text.isNotEmpty) {
      final newPost = {
        'username': widget.username,
        'handle': widget.handle,
        'content': _contentController.text.trim(),
        'likes': 0,
        'comments': [],
        'isLiked': false,
        'images': selectedImages, // ✅ แนบรูปภาพที่เลือก
      };

      Navigator.pop(context, newPost); 

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('New Post'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _contentController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'What\'s on your mind?',
                labelStyle: TextStyle(color: Colors.white70),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white70),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 10),
            
            // ✅ แสดงรูปที่เลือก
            if (selectedImages.isNotEmpty)
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedImages.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          Image.asset(selectedImages[index], width: 100, height: 100, fit: BoxFit.cover),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedImages.removeAt(index); // ✅ ลบรูปออก
                              });
                            },
                            child: const CircleAvatar(
                              radius: 12,
                              backgroundColor: Colors.red,
                              child: Icon(Icons.close, size: 16, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

            const SizedBox(height: 10),
            
            Row(
              children: [
                IconButton(
                  onPressed: _openImagePicker,
                  icon: const Icon(Icons.image, color: Colors.white),
                ),
                const Text('Add Image', style: TextStyle(color: Colors.white)),
              ],
            ),
            
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: _submitPost,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Post'),
            ),
          ],
        ),
      ),
    );
  }
}