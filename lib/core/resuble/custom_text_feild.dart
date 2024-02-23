// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  CustomContainer(
      {Key? key, this.isShow = false, this.hintext, this.icoon, this.onChaned})
      : super(key: key);
  String? hintext;
  IconData? icoon;
  bool isShow;
  Function(String)? onChaned;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.purple[100],
        borderRadius: BorderRadius.circular(66),
      ),
      width: 266,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        obscureText: isShow,
        onChanged: onChaned,
        decoration: InputDecoration(
            icon: Icon(
              icoon,
              color: Colors.purple[800],
            ),
            hintText: hintext,
            border: InputBorder.none),
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  TextEditingController? controller;
  Function(String) onSubmitted;
  Function(String) ?onPressedIcon;
  CustomText({Key? key, required this.onSubmitted,this.onPressedIcon, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      controller: controller,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: (const Icon(Icons.send)),
            onPressed: () {},
            color: Colors.grey,
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.grey)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(color: Colors.grey)),
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(16))),
    );
  }
}
