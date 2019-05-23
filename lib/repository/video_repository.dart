import 'package:metube/model/video_model.dart';
import 'package:metube/repository/video_db.dart';

class VideoRepository {
  static final VideoRepository _repo = new VideoRepository._internal();

  VideoDatabase database;

  static VideoRepository get() {
    return _repo;
  }

  VideoRepository._internal() {
    database = VideoDatabase.get();
  }

  Future addVideo(Video video) async {
    return database.insert(video);
  }

  Future getVideo(int id) async {
    return await database.getVideo(id);
  }

  Future getVideos(List<int> ids) async {
    return await database.getVideos(ids);
  }

  Future updateVideo(Video video) async {
    return await database.updateVideo(video);
  }
}
