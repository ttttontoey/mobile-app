import 'package:flutter/material.dart';
import 'chat_screen.dart';

class MainChatScreen extends StatefulWidget {
  const MainChatScreen({super.key});

  @override
  _MainChatScreenState createState() => _MainChatScreenState();
}

class _MainChatScreenState extends State<MainChatScreen> {
  final List<Map<String, dynamic>> chatList = [
    {
      'name': 'Samata',
      'message': 'ว่าไงงงง',
      'time': 'เมื่อวาน',
      'unread': 1,
      'avatar': 'assets/images/post4.jpg',
      'isPinned': false,
      'messages': [
        {'text': 'สวัสดี', 'isMe': true, 'time': '10:00'},
        {'text': 'ว่าไงงงง', 'isMe': false, 'time': '10:01'},
      ],
    },
    {
      'name': 'Tonmai',
      'message': 'ครับสุดสวย',
      'time': 'เมื่อวาน',
      'unread': 1,
      'avatar': 'assets/images/post13.jpg',
      'isPinned': false,
      'messages': [
        {'text': 'สวัสดี', 'isMe': true, 'time': '10:00'},
        {'text': 'ครับสุดสวย', 'isMe': false, 'time': 'เมื่อวาน'},
      ],
    },
    {
      'name': 'Ton',
      'message': 'ติดต่ออะไรครับ',
      'time': 'ติดต่ออะไรครับ',
      'unread': 1,
      'avatar': 'assets/images/post7.jpg',
      'isPinned': false,
      'messages': [
        {'text': 'สวัสดี', 'isMe': true, 'time': '10:00'},
        {'text': 'ติดต่ออะไรครับ', 'isMe': false, 'time': 'เมื่อวาน'},
      ],
    },
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredChatList = chatList.where((chat) {
      final name = chat['name'].toLowerCase();
      final query = searchQuery.toLowerCase();
      return name.contains(query);
    }).toList();

    // เรียงลำดับให้แชทที่ปักหมุดขึ้นก่อน
    filteredChatList.sort((a, b) {
      if (a['isPinned'] && !b['isPinned']) return -1;
      if (!a['isPinned'] && b['isPinned']) return 1;
      return 0;
    });

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'ค้นหารายชื่อแชท...',
                hintStyle: const TextStyle(color: Colors.grey),
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredChatList.length,
              itemBuilder: (context, index) {
                final chat = filteredChatList[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(chat['avatar']),
                  ),
                  title: Row(
                    children: [
                      Text(
                        chat['name'],
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      if (chat['isPinned'])
                        const Icon(Icons.push_pin,
                            color: Colors.yellow, size: 16),
                    ],
                  ),
                  subtitle: Text(
                    chat['message'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ปุ่มปักหมุด
                      IconButton(
                        icon: Icon(
                          chat['isPinned']
                              ? Icons.push_pin
                              : Icons.push_pin_outlined,
                          color: chat['isPinned'] ? Colors.yellow : Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            chat['isPinned'] = !chat['isPinned'];
                          });
                        },
                      ),
                      // จำนวนข้อความที่ยังไม่ได้อ่าน
                      if (chat['unread'] > 0)
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            chat['unread'].toString(),
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12),
                          ),
                        ),
                    ],
                  ),
                  onTap: () async {
                    final updatedMessages = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                          chatName: chat['name'],
                          messages:
                              List<Map<String, dynamic>>.from(chat['messages']),
                          chatAvatar: chat['avatar'],
                        ),
                      ),
                    );

                    if (updatedMessages != null) {
                      setState(() {
                        final chatIndex = chatList.indexOf(chat);
                        chatList[chatIndex]['messages'] = updatedMessages;
                        if (updatedMessages.isNotEmpty) {
                          chatList[chatIndex]['message'] =
                              updatedMessages.last['text'];
                          chatList[chatIndex]['time'] =
                              updatedMessages.last['time'];
                          chatList[chatIndex]['unread'] = 0;
                        }
                      });
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
