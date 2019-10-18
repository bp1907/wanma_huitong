import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'base_db_manager.dart';

///基类
abstract class BaseDbProvider {

  bool isTableExits = false;

  tableSqlString();

  tableName();

  tableBaseString(String name, String columnId) {
    return '''create table $name ($columnId integer primary key autoincrement,''';
  }

  Future<Database> getDatabase() async {
    return await open();
  }

  prepare(name, String createSql) async {
    isTableExits = await BaseDbManager.isTableExits(name);
    if(!isTableExits) {
      Database db = await BaseDbManager.getCurrentDatabase();
      return await db.execute(createSql);
    }
  }

  open() async {
    if(!isTableExits) {
      prepare(tableName(), tableSqlString());
    }
    return await BaseDbManager.getCurrentDatabase();
  }
}