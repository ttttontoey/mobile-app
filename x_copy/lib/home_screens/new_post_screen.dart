import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:image_picker/image_picker.dart';

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
  List<Uint8List> selectedImages = [];
  bool showEmojiPicker = false;
  DateTime? scheduledDate;
  String? selectedLocation;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      setState(() {
        selectedImages.add(bytes);
      });
    }
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
        'images': selectedImages,
        'scheduledDate': scheduledDate,
        'location': selectedLocation,
      };

      Navigator.pop(context, newPost);
    }
  }

  void _onEmojiSelected(Emoji emoji) {
    _contentController.text += emoji.emoji;
  }

  void _pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        scheduledDate = picked;
      });
    }
  }

  void _pickLocation() async {
    setState(() {
      selectedLocation = "Bangkok, Thailand";
    });
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
                labelText: "What's on your mind?",
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.memory(
                              selectedImages[index],
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedImages.removeAt(index);
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
                  icon: const Icon(Icons.image, color: Colors.white),
                  onPressed: _pickImage,
                ),
                IconButton(
                  icon: const Icon(Icons.gif, color: Colors.white),
                  onPressed: () {}, // Add GIF picker logic
                ),
                IconButton(
                  icon: const Icon(Icons.poll, color: Colors.white),
                  onPressed: () {}, // Add Poll creation logic
                ),
                IconButton(
                  icon: const Icon(Icons.emoji_emotions, color: Colors.white),
                  onPressed: () {
                    setState(() {
                      showEmojiPicker = !showEmojiPicker;
                    });
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.schedule, color: Colors.white),
                  onPressed: _pickDate,
                ),
                IconButton(
                  icon: const Icon(Icons.location_on, color: Colors.white),
                  onPressed: _pickLocation,
                ),
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
            if (showEmojiPicker)
              SizedBox(
                height: 250,
                child: EmojiPicker(
                  onEmojiSelected: (category, emoji) => _onEmojiSelected(emoji),
                  config: const Config(
                    columns: 7,
                    emojiSizeMax: 32,
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    initCategory: Category.RECENT,
                    bgColor: Colors.black,
                    indicatorColor: Colors.blue,
                    iconColor: Colors.white70,
                    iconColorSelected: Colors.blue,
                    backspaceColor: Colors.red,
                    emojiTextStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
