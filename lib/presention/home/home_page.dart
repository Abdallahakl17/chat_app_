// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project_level1/core/resuble/chat_buble.dart';
import 'package:flutter_final_project_level1/core/resuble/constants.dart';
import 'package:flutter_final_project_level1/core/resuble/custom_text_feild.dart';
import 'package:flutter_final_project_level1/core/resuble/models/messages.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  TextEditingController textEditingController = TextEditingController();
  final _control = ScrollController();
  @override
  Widget build(BuildContext context) {
    var id=ModalRoute.of(context)!.settings.arguments;
    CollectionReference messages =
        FirebaseFirestore.instance.collection('messages');
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('time', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> listMessage = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            listMessage.add(Message.fromjosn(snapshot.data!.docs[i]));
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: secondryColor,
              title: const Text('Chat'),
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      reverse: true,
                      controller: _control,
                      itemCount: listMessage.length,
                      itemBuilder: (context, index) {
                        return listMessage[index].id==id?  ChatBuble(
                          messageBody: listMessage[index],
                        ):ChatBubleForFriend(messageBody: listMessage[index]);
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: CustomText(
                    controller: textEditingController,
                    onSubmitted: (data) {
                      messages.add({
                        'messages': data,
                        'time': DateTime.now(),
                        'id':id
                      });
                      textEditingController.clear();
                      _control.animateTo(0,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeIn);
                    },
                  ),
                )
              ],
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
