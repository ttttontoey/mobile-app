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
      'message': 'อุย',
      'time': 'เมื่อวาน',
      'unread': 1,
      'avatar': 'assets/images/post4.jpg',
      'messages': [
        {'text': 'สวัสดี', 'isMe': true, 'time': '10:00'},
        {'text': 'ว่าไงงงง', 'isMe': false, 'time': '10:01'},
      ],
    },
    {
      'name': 'Ton',
      'message': 'อุย',
      'time': 'เมื่อวาน',
      'unread': 1,
      'avatar': 'assets/images/post7.jpg',
      'messages': [
        {'text': 'สวัสดี', 'isMe': true, 'time': '10:00'},
        {'text': 'ติดต่ออะไรครับ', 'isMe': false, 'time': 'เมื่อวาน'},
      ],
    },
    {
      'name': 'Kris',
      'message': 'Hello',
      'time': 'เมื่อวาน',
      'unread': 1,
      'avatar': 'assets/images/post13.jpg',
      'messages': [
        {'text': 'Hello', 'isMe': false, 'time': '09:45'},
      ],
    },
    {
      'name': '2020 (1)',
      'message': 'ไปไหนดี',
      'time': 'เมื่อวาน',
      'unread': 0,
      'avatar': 'assets/images/avatar4.png',
      'messages': [
        {'text': 'ไปไหนดี', 'isMe': false, 'time': '08:30'},
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
                  title: Text(
                    chat['name'],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  subtitle: Text(
                    chat['message'],
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chat['time'],
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
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
