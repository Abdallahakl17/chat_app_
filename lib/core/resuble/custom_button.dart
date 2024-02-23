// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  Color? colorButton;
  String? text;
  Function() onPressed;
  CustomButton({
    Key? key,
    this.colorButton,required this.onPressed,this.text
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorButton),
        padding: MaterialStateProperty.all(
            const EdgeInsets.symmetric(horizontal: 106, vertical: 10)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(27))),
      ),
      child: Text(
        text!,
        style: const TextStyle(fontSize: 24),
      ),
    );
  }
}
