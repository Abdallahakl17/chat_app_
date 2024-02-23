// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_final_project_level1/core/resuble/custom_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 35,
                    ),
                    Text(
                      "Welcome",
                      style: TextStyle(fontSize: 33, fontFamily: "myfont"),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    SvgPicture.asset(
                      "assets/icons/chat.svg",
                      width: 288,
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    CustomButton(
                        text: 'Login',
                        colorButton: Colors.purple[200],
                        onPressed: () {
                          Navigator.pushNamed(context, "/login");
                        }),
                    SizedBox(
                      height: 22,
                    ),
                    CustomButton(
                        text: 'SingUp',
                        colorButton: Colors.purple[200],
                        onPressed: () {
                          Navigator.pushNamed(context, "/signup");
                        })
                  ],
                ),
              ),
              Positioned(
                left: 0,
                child: Image.asset(
                  "assets/images/main_top.png",
                  width: 111,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Image.asset(
                  "assets/images/main_bottom.png",
                  width: 111,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
