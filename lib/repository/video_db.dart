import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'package:metube/model/user_model.dart';
import 'package:metube/model/video_model.dart';

class VideoDatabase {
  static final VideoDatabase _videoDb = new VideoDatabase._internal();

  final String tableName = "videos";
  Database _db;
  bool didInit = false;

  static VideoDatabase get() {
    return _videoDb;
  }

  VideoDatabase._internal();

  Future<Database> _getDb() async {
    if (!didInit) await _init();
    return _db;
  }

  Future _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "metube.db");
    _db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE $tableName ("
          "${Video.db_id} STRING PRIMARY KEY,"
          "${Video.db_title} TEXT,"
          "${Video.db_thumbnailUrl} TEXT,"
          "${Video.db_description} TEXT,"
          "${Video.db_ownerId} TEXT,"
          "${Video.db_uploadedAt} TEXT,"
          "${Video.db_category} TEXT,"
          "${Video.db_likeCount} INTEGER,"
          "${Video.db_dislikeCount} INTEGER,"
          "${Video.db_viewCount} INTEGER,"
          "CONSTRAINT fk_owner"
          "FOREIGN KEY (${Video.db_ownerId})"
          "REFERENCES ${User.tableName}(${User.db_id})"
          ")");
    });
    didInit = true;
  }

  Future<Video> insert(Video video) async {
    var db = await _getDb();
    var id = Uuid().v4();

    await db.insert(tableName, video.toMap(videoId: id));
    return video;
  }

  Future<Video> getVideo(int id) async {
    var db = await _getDb();
    List<Map> maps =
        await db.query(tableName, columns: null, where: '${User.db_id}= ?', whereArgs: [id]);

    if (maps.length > 0) {
      return Video.fromMap(maps.first);
    }

    return null;
  }

  Future<List<Video>> getVideos(List<int> ids) async {
    List<Video> videoList = [];
    var idsString = ids.map((it) => '"$it"').join(',');
    var db = await _getDb();
    List<Map> maps = await db
        .query(tableName, columns: null, where: '${Video.db_id} IN ?', whereArgs: [idsString]);

    for (var entry in maps) {
      videoList.add(Video.fromMap(entry));
    }

    return null;
  }

  Future updateVideo(Video video) async {
    var db = await _getDb();
    db.update(tableName, video.toMap(), where: '${Video.db_id} = ?', whereArgs: [video.id]);
  }

  Future<int> delete(int id) async {
    var db = await _getDb();
    return await db.delete(tableName, where: '${Video.db_id} = ?', whereArgs: [id]);
  }

  Future close() async {
    var db = await _getDb();
    return db.close();
  }
}
