import 'package:metube/model/video_model.dart';
import 'package:metube/model/category_model.dart';
import 'package:metube/model/comment_model.dart';

class Video {
  static final String db_id = 'id';
  static final String db_title = 'title';
  static final String db_thumbnailUrl = 'thumbnailUrl';
  static final String db_description = 'description';
  static final String db_ownerId = 'ownerId';
  static final String db_uploadedAt = 'uploadedAt';
  static final String db_category = 'category';
  static final String db_likeCount = 'likeCount';
  static final String db_dislikeCount = 'dislikeCount';
  static final String db_viewCount = 'viewCount';

  final String id;
  final String title;
  final String thumbnailUrl;
  final String description;
  final String ownerId;
  final DateTime uploadedAt;
  final Category category;
  final int likeCount;
  final int dislikeCount;
  final int viewCount;
  final List<Comment> commentList;

  Video(
      {this.id,
      this.title,
      this.thumbnailUrl,
      this.description,
      this.ownerId,
      this.uploadedAt,
      this.category,
      this.likeCount,
      this.dislikeCount,
      this.viewCount,
      this.commentList});

  Video.fromMap(Map<String, dynamic> map)
      : this(
          id: map[db_id],
          title: map[db_title],
          thumbnailUrl: map[db_thumbnailUrl],
          description: map[db_description],
          ownerId: map[db_ownerId],
          uploadedAt: map[db_uploadedAt],
          category: map[db_category],
          likeCount: map[db_likeCount],
          dislikeCount: map[db_dislikeCount],
          viewCount: map[db_viewCount],
        );

  Map<String, dynamic> toMap({videoId}) {
    var map = <String, dynamic>{
      db_id: videoId ?? this.id,
      db_title: this.title,
      db_thumbnailUrl: this.thumbnailUrl,
      db_description: this.description,
      db_ownerId: this.ownerId,
      db_uploadedAt: this.uploadedAt,
      db_category: this.category,
      db_likeCount: this.likeCount,
      db_dislikeCount: this.dislikeCount,
      db_viewCount: this.viewCount,
    };
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Video &&
          this.id == other.id &&
          this.title == other.title &&
          this.thumbnailUrl == other.thumbnailUrl &&
          this.description == other.description &&
          this.ownerId == other.ownerId &&
          this.uploadedAt == other.uploadedAt &&
          this.category == other.category &&
          this.likeCount == other.likeCount &&
          this.dislikeCount == other.dislikeCount &&
          this.viewCount == other.viewCount &&
          this.commentList == other.commentList);

  @override
  int get hashCode =>
      this.id.hashCode ^
      this.title.hashCode ^
      this.thumbnailUrl.hashCode ^
      this.description.hashCode ^
      this.ownerId.hashCode ^
      this.uploadedAt.hashCode ^
      this.category.hashCode ^
      this.likeCount.hashCode ^
      this.dislikeCount.hashCode ^
      this.viewCount.hashCode ^
      this.commentList.hashCode;
}
