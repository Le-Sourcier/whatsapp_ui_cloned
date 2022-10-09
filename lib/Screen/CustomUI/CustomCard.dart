// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables, file_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/Screen/Pages/page.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({Key? key, this.ChatModel}) : super(key: key);
  final ChatModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ChatRoom(
                      chatModel: ChatModel,
                    )));
      },
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundColor: Colors.blueGrey,
              child: SvgPicture.asset(
                  ChatModel.isGroup
                      ? 'assets/icons/group.svg'
                      : 'assets/icons/person.svg',
                  color: Colors.white,
                  width: 37,
                  height: 37),
            ),
            title: Text(
              ChatModel.name,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Row(children: [
              const Icon(Icons.done_all),
              const SizedBox(width: 3),
              Text(
                ChatModel.currentMessage,
                style: const TextStyle(fontSize: 13),
              )
            ]),
            trailing: Text(ChatModel.time),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 20, left: 80),
            child: Divider(thickness: 1),
          )
        ],
      ),
    );
  }
}
