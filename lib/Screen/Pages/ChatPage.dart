// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screen/CustomUI/index.dart';
import 'package:whatsapp_clone/Screen/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screen/Pages/page.dart';
import 'package:whatsapp_clone/Screen/static/color.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<ChatModel> chats = [
    ChatModel(
        name: "Le-Sourcier",
        icon: 'person.svg',
        isGroup: false,
        time: "10:15",
        currentMessage: "Hi Le-Sourcier"),
    ChatModel(
        name: "DarkSite",
        icon: 'group.svg',
        isGroup: true,
        time: "11:19",
        currentMessage: "Hello DarkNote"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: KprimaryColor,
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (build) => const SelectContact())),
        child: const Icon(Icons.chat),
      ),
      body: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (contex, index) => CustomCard(
          ChatModel: chats[index],
        ),
      ),
    );
  }
}
