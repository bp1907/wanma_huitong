import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:wanma_huitong/common/db/base_db_provider.dart';

class UserInfoDbProvider extends BaseDbProvider {

  //表名
  final String name = 'UserInfo';

  final String columnId = '_id';

  final String columnUserName = 'userName';

  final String columnPassword = 'password';

  int id;

  String userName;

  String password;

  UserInfoDbProvider();

  Map<String, dynamic> toMap(String userName, String password) {
    Map<String, dynamic> map = {
      columnUserName: userName,
      columnPassword: password,
    };
    if(id != null) {
      map[columnId] = id;
    }
    return map;
  }

  UserInfoDbProvider.fromMap(Map map) {
    id = map[columnId];
    userName = map[columnUserName];
    password = map[columnPassword];
  }

  @override
  tableName() {
    return name;
  }

  @override
  tableSqlString() {
    return tableBaseString(name, columnId) +
        '''
        $columnUserName text not null,
        $columnPassword text not null)
    ''';
  }

  //插入用户到数据库
  Future insert(String userName, String password) async {
    Database db = await getDatabase();
    UserInfoDbProvider provider = await _getUserInfoProvider(db, userName);
    if(provider != null) {
      await db.delete(name, where: '$columnUserName = ?', whereArgs: [userName]);
    }
    return await db.insert(name, toMap(userName, password));
  }

  Future _getUserInfoProvider(Database db, String userName) async {
    List<Map<String, dynamic>> list =
    await db.query(
      name,
      columns: [columnId, columnUserName, columnPassword],
      where: '$columnUserName = ?',
      whereArgs: [userName]
    );
    if(list.length > 0) {
      UserInfoDbProvider provider = UserInfoDbProvider.fromMap(list.first);
      return provider;
    }
    return null;
  }

}