import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_taking_app/models/note_model.dart';

Box? box;

class DatabaseHelper {
  open() async {
    await Hive.initFlutter(); //initialized
    box = await Hive.openBox('noteBox');

    // var databasesPath = await getDatabasesPath();
    // String path = join(databasesPath, 'flutterclass.db');

// Delete the database
//await deleteDatabase(path);

// open the database
    // database = await openDatabase(path, version: 1,
    //     onCreate: (Database db, int version) async {
    //   // When creating the db, create the table
    //   await db.execute(
    //       'CREATE TABLE notes (id INTEGER PRIMARY KEY, title TEXT, content TEXT)');
    // });
  }

  insertNote(String title, String content) async {
    // List result = await database.rawQuery(
    //     'INSERT INTO notes(title, content) VALUES("$title","$content")');
    box!.put('Title', title);
    box!.put('Detail', content);

    // print('inserted1: $result');
  }

  NoteModel getNotes() {
    String Title = box!.get('Title');
    String Detail = box!.get('Detail');
    print('$Title,$Detail');
    return NoteModel(title: Title, content: Detail);
  }
}
