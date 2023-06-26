import 'package:chat_app/screens/chat_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chat_app/screens/signIn_page.dart';
import 'package:chat_app/screens/signUp_page.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      routes: {
        'LoginPage': (context) => SignUpPage(),
        'SignUpPage': (context) => RegistetionPage(),
        'ChatPage': (context) => ChatPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SignUpPage(),
    );
  }
}
