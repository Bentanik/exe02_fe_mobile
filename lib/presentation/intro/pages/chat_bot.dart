import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:exe02_fe_mobile/Servers/gemini/gemini_api.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  List<ChatMessage> messages = [];
  final GeminiService geminiService = GeminiService();

  final ChatUser currentUser = ChatUser(id: '0', firstName: "User");
  final ChatUser geminiUser = ChatUser(
    id: '1',
    firstName: "antiSCM bot",
    profileImage: AppImages.chatBot,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('antiSCM Bot'),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
      currentUser: currentUser,
      onSend: _sendMessage,
      messages: messages,
    );
  }

  void _sendMessage(ChatMessage chatMessage) async {
    setState(() {
      messages.insert(0, chatMessage);
    });

    String question = chatMessage.text;
    print("🔍 Sending request to Gemini...");

    String? response = await geminiService.getResponse(question);

    print("✅ Bot response: $response");

    ChatMessage botMessage = ChatMessage(
      user: geminiUser,
      createdAt: DateTime.now(),
      text: response ?? "⚠️ Không có phản hồi.",
    );

    setState(() {
      messages.insert(0, botMessage);
    });
  }
}
