import 'package:uuid/uuid.dart';

import 'package:metube/model/user_model.dart';
import 'package:metube/model/category_model.dart';
import 'package:metube/model/comment_model.dart';

class Video {
  final String _id;
  final String title;
  final String thumbnailUrl;
  final String description;
  final User owner;
  final DateTime uploadedAt;
  final Category category;
  final int likeCount;
  final int dislikeCount;
  final int viewCount;
  final List<Comment> commentList;

  Video(this.title, this.thumbnailUrl, this.description, this.owner, this.uploadedAt, this.category,
      this.likeCount, this.dislikeCount, this.viewCount, this.commentList)
      : this._id = (new Uuid()).v4();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Video &&
          this._id == other._id &&
          this.title == other.title &&
          this.thumbnailUrl == other.thumbnailUrl &&
          this.description == other.description &&
          this.owner == other.owner &&
          this.uploadedAt == other.uploadedAt &&
          this.category == other.category &&
          this.likeCount == other.likeCount &&
          this.dislikeCount == other.dislikeCount &&
          this.viewCount == other.viewCount &&
          this.commentList == other.commentList);

  @override
  int get hashCode =>
      this._id.hashCode ^
      this.title.hashCode ^
      this.thumbnailUrl.hashCode ^
      this.description.hashCode ^
      this.owner.hashCode ^
      this.uploadedAt.hashCode ^
      this.category.hashCode ^
      this.likeCount.hashCode ^
      this.dislikeCount.hashCode ^
      this.viewCount.hashCode ^
      this.commentList.hashCode;
}
