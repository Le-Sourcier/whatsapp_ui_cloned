// ignore_for_file: avoid_print, file_names

import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Screen/CustomUI/index.dart';
import 'package:whatsapp_clone/Screen/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screen/Pages/page.dart';

class SelectContact extends StatefulWidget {
  const SelectContact({Key? key}) : super(key: key);

  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Contact',
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '256 contacts',
                style: TextStyle(
                  fontSize: 12,
                ),
              )
            ],
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, size: 26),
            ),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  value: 'Invite a friend',
                  child: Text('Invite a friend'),
                ),
                PopupMenuItem(
                  value: 'Contacts',
                  child: Text('Contacts'),
                ),
                PopupMenuItem(
                  value: 'Refresh',
                  child: Text('Refresh'),
                ),
                PopupMenuItem(
                  value: 'Help',
                  child: Text('Help'),
                ),
              ];
            })
          ],
        ),
        body: ListView.builder(
            itemCount: contacts.length + 2,
            itemBuilder: (context, index) {
              if (index == 0) {
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (builder) => const CreateGroup()));
                    },
                    child:
                        const ButtonCard(name: 'New group', icon: Icons.group));
              } else if (index == 1) {
                return const ButtonCard(
                    name: 'New contact', icon: Icons.person_add);
              }
              return ContactCard(
                contact: contacts[index - 2],
              );
            }));
  }
}
