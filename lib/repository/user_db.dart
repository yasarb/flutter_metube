import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'package:metube/model/user_model.dart';

class UserDatabase {
  static final UserDatabase _userDb = new UserDatabase._internal();

  final String tableName = User.tableName;
  Database _db;
  bool didInit = false;

  static UserDatabase get() {
    return _userDb;
  }

  UserDatabase._internal();

  Future<Database> _getDb() async {
    if (!didInit) await _init();
    return _db;
  }

  Future _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "metube.db");
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $tableName ("
          "${User.db_id} STRING PRIMARY KEY,"
          "${User.db_name} TEXT UNIQUE,"
          "${User.db_imageUrl} TEXT,"
          "${User.db_bannerUrl} TEXT,"
          "${User.db_subscriberCount} INTEGER"
          ")");
    });
    didInit = true;
  }

  Future<User> insert(User user) async {
    var db = await _getDb();
    var id = Uuid().v4();

    await db.insert(tableName, user.toMap(userId: id));
    return user;
  }

  /// Get a user by its id, if there is not entry for that ID, returns null.
  Future<User> getUser(int id) async {
    var db = await _getDb();
    List<Map> maps =
        await db.query(tableName, columns: null, where: '${User.db_id}= ?', whereArgs: [id]);

    if (maps.length > 0) {
      return User.fromMap(maps.first);
    }

    return null;
  }

  /// Get all books with ids, will return a list with all the books found
  Future<List<User>> getUsers(List<int> ids) async {
    List<User> userList = [];
    var idsString = ids.map((it) => '"$it"').join(',');
    var db = await _getDb();
    List<Map> maps = await db
        .query(tableName, columns: null, where: '${User.db_id} IN ?', whereArgs: [idsString]);

    for (var entry in maps) {
      userList.add(User.fromMap(entry));
    }

    return userList;
  }

  /// Inserts or replaces the book.
  Future updateUser(User user) async {
    var db = await _getDb();
    return await db
        .update(tableName, user.toMap(), where: '${User.db_id} = ?', whereArgs: [user.id]);
  }

  Future<int> delete(int id) async {
    var db = await _getDb();
    return await db.delete(tableName, where: '${User.db_id} = ?', whereArgs: [id]);
  }

  Future close() async {
    var db = await _getDb();
    return db.close();
  }
}
