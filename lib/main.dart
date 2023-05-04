import 'package:flutter/material.dart';
import 'package:note_taking_app/helpers/database_helper.dart';
import 'package:note_taking_app/home_screen.dart';

//Covention
//class,type: ClassName
//variable: variableName
//method: methodName()
//file: file_name

void main() {
  // DatabaseHelper().open();
  runApp(const NoteTakingApp());
}

class NoteTakingApp extends StatelessWidget {
  const NoteTakingApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Note Taking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
