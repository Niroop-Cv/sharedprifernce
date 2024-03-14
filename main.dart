import 'package:flutter/material.dart';
import 'package:task_app/chatList.dart';
import 'package:task_app/colorPlay.dart';
import 'package:task_app/home.dart';
import 'package:task_app/homeSTATE.dart';
import 'package:task_app/validator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // home: MyHome(),


      // home: NewClass( name: "FOOTBALL CLUB"),
      // home: ColorPlay(),

      // home: MyValidator(),
      home:DataList(),
    
      title: "codeme",
      debugShowCheckedModeBanner: false,
    );
  }
}
