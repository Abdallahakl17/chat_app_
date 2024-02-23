import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final_project_level1/firebase_options.dart';

import 'presention/home/home_page.dart';
import 'presention/login/login.dart';
import 'presention/singup/signup.dart';
import 'presention/welcom/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => const Welcome(),
        "/login": (context) => const Login(),
        "/signup": (context) => const Signup(),
        "HomePage": (context) =>  HomePage()
      },
    );
  }
}
