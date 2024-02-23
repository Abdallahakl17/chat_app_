// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_final_project_level1/core/resuble/constants.dart';
import 'package:flutter_final_project_level1/core/resuble/models/messages.dart';

class ChatBuble extends StatelessWidget {
final  Message messageBody;
  const  ChatBuble({
    Key? key,
    required this.messageBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
            color: kPrimaryColor),
        child: Text(
          messageBody.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ChatBubleForFriend extends StatelessWidget {
  final Message messageBody;

  const  ChatBubleForFriend({
    Key? key,
    required this.messageBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding:
            const EdgeInsets.only(left: 16, top: 32, bottom: 32, right: 32),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
            bottomLeft: Radius.circular(32),
          ),
          color: Color.fromARGB(255, 143, 46, 106),
        ),
        child: Text(
          messageBody.message,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
