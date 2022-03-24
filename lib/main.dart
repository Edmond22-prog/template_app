import 'package:flutter/material.dart';
import 'package:speak_and_translate_app/first_open.dart';
import 'package:speak_and_translate_app/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Application',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Roboto'
      ),
      home: const FirstOpen(),
      // const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


