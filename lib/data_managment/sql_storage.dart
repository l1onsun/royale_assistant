import 'package:sqflite/sqflite.dart';

class SQLStorage {
  Database repository;

  bool inited = false;
  init() async {
    repository = await openDatabase('my_db.db', onCreate: null);
    inited = true;
  }

  _onCreate(Database db, int version) async {
//     await db.execute('''
// create table $tableTodo (
//   $columnId integer primary key autoincrement,
//   $columnTitle text not null,
//   $columnDone integer not null)
// ''');
  }
}
