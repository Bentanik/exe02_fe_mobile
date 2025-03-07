import 'package:exe02_fe_mobile/Servers/gemini/gemini_api.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final List<Map<String, String>> messages = [];
  final TextEditingController _controller = TextEditingController();
  final GeminiService geminiService = GeminiService();

  List<String> exampleQuestions = [
    "Làm sao để nhận biết một tin nhắn lừa đảo?",
    "SCM là gì và tại sao quan trọng?",
    "Làm thế nào để phát hiện nội dung sao chép?",
  ];

  void _sendMessage(String text) async {
    if (text.isEmpty) return;

    setState(() {
      messages.insert(0, {"user": "User", "text": text});
      messages.insert(0, {"user": "Bot", "text": "..."});
    });
    String? response = await geminiService.getResponse(text);
    setState(() {
      messages.removeAt(0);
      messages.insert(0, {"user": "Bot", "text": response ?? "Không có phản hồi."});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('antiSCM Bot'), centerTitle: true),
      body: Column(
        children: [
          _buildExampleQuestions(),
          Expanded(child: _buildMessageList()),
          _buildInputField(),
        ],
      ),
    );
  }

  Widget _buildExampleQuestions() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: exampleQuestions.map((question) {
          return GestureDetector(
            onTap: () => _sendMessage(question),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFF047099), width: 1.0),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(question, style: const TextStyle(fontSize: 14)),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildMessageList() {
    return ListView.builder(
      reverse: true,
      padding: const EdgeInsets.all(10),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final message = messages[index];
        bool isUser = message["user"] == "User";

        return Row(
          mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            if (!isUser)
              const CircleAvatar(
                backgroundImage: AssetImage(AppImages.chatBot),
                radius: 20,
              ),
            const SizedBox(width: 8),
            Flexible(
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.symmetric(vertical: 5),
                constraints: const BoxConstraints(
                  maxWidth: 250,
                ),
                decoration: BoxDecoration(
                  color: isUser ? Color(0xFF047099) : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  message["text"]!,
                  style: TextStyle(fontSize: 16, color: isUser ? Colors.white : Colors.black,),
                  softWrap: true,
                ),
              ),
            ),
            const SizedBox(width: 8),
            if (isUser)
              const CircleAvatar(
                backgroundImage: AssetImage(AppImages.bg),
                radius: 20,
              ),
          ],
        );
      },
    );
  }

  Widget _buildInputField() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Nhập tin nhắn...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF047099)),
            onPressed: () {
              _sendMessage(_controller.text);
              _controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
