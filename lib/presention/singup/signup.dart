// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, unused_local_variable


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project_level1/core/resuble/custom_button.dart';
import 'package:flutter_final_project_level1/core/resuble/custom_text_feild.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String? password;

  String? email;

  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isloading,
      child: Scaffold(
        body: ListView(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Sign up",
                          style: TextStyle(
                              fontSize: 35,
                              fontFamily: "myfont",
                              color: Colors.grey[800]),
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        SvgPicture.asset(
                          "assets/icons/signup.svg",
                          height: 222,
                        ),
                        SizedBox(
                          height: 27,
                        ),
                        CustomContainer(
                          icoon: Icons.email,
                          hintext: ' E-mail',
                          onChaned: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: 23,
                        ),
                        CustomContainer(
                          icoon: Icons.lock,
                          hintext: ' Password',
                          isShow: true,
                          onChaned: (value) {
                            password = value;
                          },
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        CustomButton(
                          onPressed: () async {
                            isloading = true;
                            setState(() {});
                            try {
                              await register();
                              snakbar(context, 'Success');
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                snakbar(context, 'weak password');
                              } else if (e.code == 'email-already-in-use') {
                                snakbar(context, 'email already use');
                              }
                            } catch (e) {
                              snakbar(context, e.toString());
                            }
                            isloading = false;
                            setState(() {});
                          },
                          text: 'SingUp',
                          colorButton: Colors.purple,
                        ),
                        SizedBox(
                          height: 33,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an accout? "),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, "/login");
                              },
                              child: Text(
                                " Log in",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        SizedBox(
                          width: 299,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                thickness: 0.6,
                                color: Colors.purple[900],
                              )),
                              Text(
                                "OR",
                                style: TextStyle(
                                  color: Colors.purple[900],
                                ),
                              ),
                              Expanded(
                                  child: Divider(
                                thickness: 0.6,
                                color: Colors.purple[900],
                              )),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 27),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.purple, width: 1)),
                                  child: SvgPicture.asset(
                                    "assets/icons/facebook.svg",
                                    color: Colors.purple[400],
                                    height: 27,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 22,
                              ),
                              GestureDetector(
                                onTap: () {
                               
                                },
                                child: Container(
                                  padding: EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.purple, width: 1)),
                                  child: SvgPicture.asset(
                                    "assets/icons/google-plus.svg",
                                    color: Colors.purple[400],
                                    height: 27,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 22,
                              ),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  padding: EdgeInsets.all(13),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.purple, width: 1)),
                                  child: SvgPicture.asset(
                                    "assets/icons/twitter.svg",
                                    color: Colors.purple[400],
                                    height: 27,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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

  Future<void> register() async {
    UserCredential credential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email!,
      password: password!,
    );
  }

  void snakbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

