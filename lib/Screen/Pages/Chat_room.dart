// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, file_names, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:whatsapp_clone/Screen/Model/ChatModel.dart';
import 'package:whatsapp_clone/Screen/static/color.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({Key? key, required this.chatModel}) : super(key: key);
  final ChatModel chatModel;

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  bool show = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          leadingWidth: 80,
          titleSpacing: 5,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 10),
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.blueGrey,
                child: SvgPicture.asset(
                    widget.chatModel.isGroup!
                        ? 'assets/icons/group.svg'
                        : 'assets/icons/person.svg',
                    color: Colors.white,
                    width: 37,
                    height: 37),
              ),
            ],
          ),
          title: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatModel.name!,
                    style: const TextStyle(
                        fontSize: 18.5, fontWeight: FontWeight.bold)),
                widget.chatModel.isGroup!
                    ? Container()
                    : const Text('Last seen today at 12:00',
                        style: TextStyle(
                            fontSize: 12.0, fontStyle: FontStyle.italic))
              ],
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.videocam)),
            IconButton(onPressed: () {}, icon: const Icon(Icons.call)),
            PopupMenuButton<String>(onSelected: (value) {
              print(value);
            }, itemBuilder: (BuildContext context) {
              return const [
                PopupMenuItem(
                  value: 'View contact',
                  child: Text('View contact'),
                ),
                PopupMenuItem(
                  value: 'Media, link and doc',
                  child: Text('Media, link and doc'),
                ),
                PopupMenuItem(
                  value: 'LetsTalk web',
                  child: Text('LetsTalk web'),
                ),
                PopupMenuItem(
                  value: 'Search',
                  child: Text('Search'),
                ),
                PopupMenuItem(
                  value: 'Mute Notification',
                  child: Text('Mute Notification'),
                ),
                PopupMenuItem(
                  value: 'Wallpaper',
                  child: Text('Wallpaper'),
                ),
              ];
            })
          ],
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(children: [
          ListView(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 60,
                      child: Card(
                          margin: const EdgeInsets.only(
                              left: 2, right: 2, bottom: 8),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          child: TextFormField(
                            textAlignVertical: TextAlignVertical.center,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            minLines: 1,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Type a message',
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.emoji_emotions),
                                onPressed: () {
                                  setState(() {
                                    show = !show;
                                  });
                                },
                              ),
                              suffixIcon: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (builder) =>
                                                bottomSheet());
                                      },
                                      icon: const Icon(Icons.attach_file)),
                                  IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.camera_alt))
                                ],
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 8, right: 5, left: 2),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: KprimaryColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.mic,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // show ? emojiSelect() : Container(),
              ],
            ),
          )
        ]),
      ),
    );
  }

  Widget bottomSheet() {
    return SizedBox(
      height: 278,
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: const EdgeInsets.all(18.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(
                      Icons.insert_drive_file, Colors.indigo, 'Document'),
                  const SizedBox(width: 40),
                  iconcreation(Icons.camera_alt, Colors.pink, 'Camera'),
                  const SizedBox(width: 40),
                  iconcreation(Icons.insert_photo, Colors.purple, 'Gallery'),
                ],
              ),
              //
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.headset, Colors.orange, 'Audio'),
                  const SizedBox(width: 40),
                  iconcreation(Icons.location_pin, Colors.teal, 'Location'),
                  const SizedBox(width: 40),
                  iconcreation(Icons.person, Colors.blue, 'Contact'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  //
  Widget iconcreation(IconData icon, Color color, String text) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: Icon(
              icon,
              size: 29,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: const TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }

//   Widget emojiSelect() {

//     return EmojiPicker2(
//         rows: 4,
//         columns: 7,
//         onEmojiSelected: (emoji, category) {
//           print(emoji);
//         });
//   }
}
