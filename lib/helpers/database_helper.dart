import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_taking_app/models/note_model.dart';

class DatabaseHelper {
  static late Box box;
  open() async {
    await Hive.initFlutter(); //initialize
    box = await Hive.openBox('noteBox');

    // var databasesPath = await getDatabasesPath();
    // String path = join(databasesPath, 'flutterclass.db');

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
    box.put('title', title);
    box.put('detail', content);

    // print('inserted1: $result');
  }

  NoteModel getNotes() {
    String title = box.get('title', defaultValue: '');
    String detail = box.get('detail', defaultValue: '');
    print('$title,$detail');
    return NoteModel(title: title, content: detail);
  }
}
