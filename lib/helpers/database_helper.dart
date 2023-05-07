import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static late Database database;
  open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'flutterclass.db');

// Delete the database
//await deleteDatabase(path);

// open the database
    database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      // When creating the db, create the table
      await db.execute(
          'CREATE TABLE notes (id INTEGER PRIMARY KEY, title TEXT, content TEXT)');
    });
  }

  insertNote(String title, String content) async {
    List result = await database.rawQuery(
        'INSERT INTO notes(title, content) VALUES("$title","$content")');
    print('inserted1: $result');
  }
}
