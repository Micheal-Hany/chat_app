import 'package:chat_app/helper/show_snack_bar.dart';
import 'package:chat_app/models/massage_model.dart';
import 'package:chat_app/widgets/custom_chat_bubble.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/scheduler.dart';

class ChatPage extends StatelessWidget {
  final _contraller = ScrollController();
  final userNameOfWhoSend;

  ChatPage({this.userNameOfWhoSend});

  CollectionReference masseges =
      FirebaseFirestore.instance.collection('masseges');
  TextEditingController textContraller = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textContraller.dispose();
    //super.dispose();
  }

  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: masseges.orderBy('createdAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Massage> massageList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            massageList.add(Massage.fromJson(snapshot.data!.docs[i]));
          }
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Color(0xff2B475E),
                automaticallyImplyLeading: false,
                title: Center(child: Text('Chat Page')),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        reverse: true,
                        controller: _contraller,
                        itemCount: massageList.length,
                        itemBuilder: (context, index) {
                          return massageList[index].id == email
                              ? ChatBubble(
                                  massage: massageList[index],
                                )
                              : ChatBubbleForFerind(
                                  userNameOfWhoSend: massageList[index].id,
                                  massage: massageList[index]);
                        }),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5, right: 5),
                    child: TextField(
                      controller: textContraller,
                      decoration: InputDecoration(
                          hintText: 'Send Massage',
                          suffixIcon: IconButton(
                            onPressed: () {
                              masseges.add({
                                'massage': textContraller.text,
                                'createdAt': DateTime.now(),
                                "id": email,
                              });
                              textContraller.clear();
                              _contraller.animateTo(0,
                                  duration: Duration(seconds: 1),
                                  curve: Curves.fastOutSlowIn);
                            },
                            icon: Icon(Icons.send),
                            color: Colors.blue,
                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff2B475E)),
                              borderRadius: BorderRadius.circular(32))),
                    ),
                  ),
                ],
              ));
        } else {
          return Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
