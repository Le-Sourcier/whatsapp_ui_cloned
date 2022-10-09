// ignore_for_file: file_names

class ChatModel {
  String? name;
  String? icon;
  bool? isGroup;
  String? time;
  String? status;
  bool select = false;
  String? currentMessage;

  ChatModel(
      {this.name,
      this.icon,
      this.isGroup,
      this.time,
      this.status,
      this.select = false,
      this.currentMessage});
}

//Contacts
List<ChatModel> contacts = [
  ChatModel(
    name: "Le-Sourcier",
    status: "A full  satck developer",
  ),
  ChatModel(
    name: "DarkSite",
    status: "Flutter app developer",
  ),
];
