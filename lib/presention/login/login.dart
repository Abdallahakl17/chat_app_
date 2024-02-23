// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_final_project_level1/core/resuble/custom_button.dart';
import 'package:flutter_final_project_level1/core/resuble/custom_text_feild.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? email;

  String? password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final _key = GlobalKey<FormState>();

    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: ListView(children: [
          SizedBox(
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
                        "Log in",
                        style: TextStyle(fontSize: 33, fontFamily: "myfont"),
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      SvgPicture.asset(
                        "assets/icons/login.svg",
                        width: 288,
                      ),
                      SizedBox(
                        height: 35,
                      ),
                      CustomContainer(
                        onChaned: (value) {
                          email = value;
                        },
                        hintext: 'E-mail',
                        icoon: Icons.email,
                      ),
                      SizedBox(
                        height: 23,
                      ),
                      CustomContainer(
                      isShow: true,
                        icoon: Icons.lock,
                        hintext: ' Password',
                        onChaned: (value) {
                          password = value;
                        },
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      CustomButton(
                        onPressed: () async {
                          isLoading = true;
                          setState(() {});
                          try {
                            await login();
                            Navigator.pushNamedAndRemoveUntil(
                                context, 'HomePage', (route) => false,arguments: email);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              snakbar(context, 'Uer Not Found');
                            } else if (e.code == 'wrong-password') {
                              snakbar(context, 'Worng Password');
                            }
                          } catch (e) {
                            snakbar(context, 'there was an error');
                          }
                          isLoading = false;
                          setState(() {});
                        },
                        text: 'Login',
                        colorButton: Colors.purple,
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Don't have an accout? "),
                          GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/signup");
                              },
                              child: Text(
                                " Sign up",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              )),
                        ],
                      )
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
                  right: 0,
                  child: Image.asset(
                    "assets/images/login_bottom.png",
                    width: 111,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Future<void> login() async {
    final credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}

void snakbar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
