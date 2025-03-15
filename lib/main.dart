// import 'package:final_exam_650710077/checkname/profile.dart'; // เช็คชื่อ
import 'package:final_exam_650710077/answer1.dart'; // answer1
import 'package:final_exam_650710077/answer2.dart'; // answer2
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      // home: Answer1(),
      home: Answer2(),
    );
  }
}