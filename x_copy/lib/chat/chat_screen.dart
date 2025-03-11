import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String chatName;
  final String chatAvatar;
  final List<Map<String, dynamic>> messages;

  const ChatScreen({
    super.key,
    required this.chatName,
    required this.chatAvatar,
    required this.messages,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  late List<Map<String, dynamic>> _messages;

  // รายการรูปภาพใน assets ให้เลือก
  final List<String> _assetImages = [
    'assets/images/post8.jpg',
    'assets/images/post9.jpg',
    'assets/images/post10.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _messages = widget.messages;
  }

  // ฟังก์ชันส่งข้อความหรือรูปภาพ
  void _sendMessage({String? text, String? imageAsset}) {
    if (text != null && text.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': text,
          'isMe': true,
          'time': DateTime.now().toLocal().toString().substring(11, 16),
          'isImage': false,
        });
        _messageController.clear();
      });
    } else if (imageAsset != null) {
      setState(() {
        _messages.add({
          'image': imageAsset,
          'isMe': true,
          'time': DateTime.now().toLocal().toString().substring(11, 16),
          'isImage': true,
        });
      });
    }
  }

  // ฟังก์ชันแสดง Dialog เลือกรูปจาก assets
  void _pickImageFromAssets() async {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text('เลือกรูปภาพ', style: TextStyle(color: Colors.white)),
        content: SizedBox(
          width: double.maxFinite,
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: _assetImages.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  _sendMessage(imageAsset: _assetImages[index]);
                },
                child: Image.asset(
                  _assetImages[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
  backgroundColor: Colors.grey[900],
  centerTitle: true,
  toolbarHeight: 80, // เพิ่มความสูงของ AppBar
  leading: IconButton(
    icon: const Icon(Icons.arrow_back, color: Colors.blue),
    onPressed: () {
      Navigator.pop(context, _messages);
    },
  ),
  title: Padding(
    padding: const EdgeInsets.symmetric(vertical: 10), // เว้นระยะขอบบน-ล่าง
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(widget.chatAvatar),
          radius: 24, // เพิ่มขนาดรูปนิดหน่อย
        ),
        const SizedBox(height: 6),
        Text(
          widget.chatName,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    ),
  ),
),

      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: (message['isMe'] ?? false)
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: (message['isMe'] ?? false) ? Colors.blue : Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: (message['isImage'] ?? false)
                        ? Image.asset(
                            message['image'] ?? '',
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          )
                        : Text(
                            message['text'] ?? '',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.photo, color: Colors.green,size: 25,),
                  onPressed: _pickImageFromAssets,
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'พิมพ์ข้อความ...',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.blue),
                  onPressed: () => _sendMessage(text: _messageController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
