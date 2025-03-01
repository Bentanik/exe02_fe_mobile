import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:exe02_fe_mobile/core/configs/assets/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key});

  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  final Gemini gemini = Gemini.instance;
  List<ChatMessage> messages = [];
  ChatUser currentUser = ChatUser(id: '0', firstName: "User");
  ChatUser geminiUser =
      ChatUser(id: '1', firstName: "Gemini", profileImage: AppImages.chatBot);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chat Bot'),
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return DashChat(
        currentUser: currentUser, onSend: _sendMesage, messages: messages);
  }

  void _sendMesage(ChatMessage chatMessage) {
    setState(() {
      messages = [chatMessage, ...messages];
    });
    try {
      String question = chatMessage.text;
      gemini.streamGenerateContent(question).listen((event) {
        ChatMessage? lastMessage = messages.firstOrNull;
        if (chatMessage != null && lastMessage?.user == geminiUser) {
          lastMessage = messages.removeAt(0);
          String response = event.content?.parts
              ?.fold("", (previous, current) => "$previous${(current as TextPart).text}") ?? "";
          lastMessage.text = response;
          setState(() {
            messages = [lastMessage!, ...messages];
          });
        } else {
          String response = event.content?.parts
              ?.fold("", (previous, current) => "$previous${(current as TextPart).text}") ?? "";
          ChatMessage message = ChatMessage(
              user: geminiUser, createdAt: DateTime.now(), text: response);
          setState(() {
            messages = [message, ...messages];
          });
        }
      });
    } catch (e) {
      print(e);
    }
  }
}

