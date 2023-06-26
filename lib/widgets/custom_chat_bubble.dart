import 'package:chat_app/models/massage_model.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({
    required this.massage,
  });
  final Massage massage;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff2B475E),
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32))),
        margin: EdgeInsets.all(10),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Column(
              children: [
                Text(
                  'me',
                  style: TextStyle(color: Colors.red),
                ),
                Text(
                  massage.massage,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatBubbleForFerind extends StatelessWidget {
  ChatBubbleForFerind({required this.massage, required this.userNameOfWhoSend});
  final Massage massage;
  final userNameOfWhoSend;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(32),
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32))),
        margin: EdgeInsets.all(10),
        // alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            child: Column(
              children: [
                Text(
                  getUsernameFromEmail(userNameOfWhoSend),
                  style: TextStyle(color: Colors.amber),
                ),
                Text(
                  massage.massage,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String getUsernameFromEmail(userNameOfWhoSend) {
  List<String> parts = userNameOfWhoSend.split('@');

  String username = parts[0];
  return username;
}
