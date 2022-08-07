import 'dart:core';

import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';
// import 'package:tutor_me/modules/api.services.dart';
// import 'package:tutor_me/modules/tutors.dart';
// import 'tutorProfilePages/tutor_profile_view.dart';
// import 'Navigation/nav_drawer.dart';
// import 'tuteeProfilePages/tutee_data.dart';
// import 'theme/themes.dart';

class Message {
  String text;
  DateTime date;
  bool isSentByMe;
  bool isOnline;
  String sentBy;

  Message(this.text, this.date, this.isSentByMe, this.isOnline, this.sentBy);
}

class Chat extends StatefulWidget {
  const Chat({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ChatState();
  }
}

class ChatState extends State<Chat> {
  bool isTapped = false;
  TextEditingController messageTextCOntroller = TextEditingController();
  List<Message> messages = [
    Message('Hi', DateTime.now().subtract(const Duration(minutes: 4)), true,
        true, 'You'),
    Message(
        'Hi, how can I help',
        DateTime.now().subtract(const Duration(minutes: 4)),
        false,
        true,
        'Women Hacks'),
    Message('I need to find women empoerment communities',
        DateTime.now().subtract(const Duration(minutes: 3)), true, true, 'You'),
    Message(
        'I have found one community that are active online.\n -\'Women Empowerd\'\n-',
        DateTime.now().subtract(const Duration(minutes: 3)),
        false,
        true,
        'You'),
    Message('Thank you.', DateTime.now().subtract(const Duration(minutes: 3)),
        true, true, 'You'),
    Message(
        'You are welcome! Just say hi if you need anything else',
        DateTime.now().subtract(const Duration(minutes: 3)),
        false,
        true,
        'Women Hacks'),
  ].toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.pink[100],
            title: Row(
              children: const [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/Pictures/Watercolor Blue Minimalist Flower Logo2 1.png'),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Women Hacks ChatBot'),
              ],
            )),
        body: Column(
          children: [
            Expanded(
              child: GroupedListView<Message, DateTime>(
                padding: const EdgeInsets.all(8),
                reverse: true,
                order: GroupedListOrder.DESC,
                useStickyGroupSeparators: true,
                floatingHeader: true,
                elements: messages,
                groupBy: (message) => DateTime(
                    message.date.year, message.date.month, message.date.day),
                groupHeaderBuilder: (Message message) => SizedBox(
                  height: 40,
                  child: Center(
                    child: Card(
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          DateFormat.yMMMd().format(message.date),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ),
                itemBuilder: (context, Message message) => Align(
                  alignment: message.isSentByMe
                      ? Alignment.topRight
                      : Alignment.topLeft,
                  child: Card(
                    color: message.isSentByMe
                        ? const Color(0xFFEF9CAF).withOpacity(0.8)
                        : Colors.grey[300],
                    elevation: 8,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: <Widget>[
                          message.isSentByMe
                              ? Text("You",
                                  style: TextStyle(
                                      color: Colors.blue[400],
                                      fontWeight: FontWeight.bold))
                              : Text(message.sentBy,
                                  style: TextStyle(
                                      color: Colors.blue[400],
                                      fontWeight: FontWeight.bold)),
                          Text(
                            message.text,
                            style: TextStyle(
                                color: message.isSentByMe
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(4),
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(50)),
              child: TextField(
                onTap: () {
                  isTapped = true;
                },
                keyboardType: TextInputType.multiline,
                maxLines: null,
                controller: messageTextCOntroller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: isTapped
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            color: Colors.black,
                            iconSize:
                                MediaQuery.of(context).size.height * 0.045,
                            onPressed: messageTextCOntroller.clear,
                          )
                        : Icon(
                            Icons.mail,
                            color: Colors.blue,
                            size: MediaQuery.of(context).size.height * 0.045,
                          ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.send,
                        color: Colors.blue,
                        size: MediaQuery.of(context).size.height * 0.045,
                      ),
                      onPressed: () {},
                    ),
                    contentPadding: const EdgeInsets.all(14),
                    hintText: 'Type your message...'),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            )
          ],
        ));
  }
}
