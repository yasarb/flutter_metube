import 'package:uuid/uuid.dart';

import 'package:metube/models/user_model.dart';

class Comment {
  final String _id;
  final User owner;
  final String text;
  final DateTime commentedAt;
  final int likeCount;
  final int dislikeCount;

  Comment(this.owner, this.text, this.commentedAt, this.likeCount, this.dislikeCount)
      : this._id = (new Uuid()).v4();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Comment &&
          this.owner == other.owner &&
          this.text == other.text &&
          this.commentedAt == other.commentedAt &&
          this.likeCount == other.likeCount &&
          this.dislikeCount == other.dislikeCount);

  @override
  int get hashCode =>
      this.owner.hashCode ^
      this.text.hashCode ^
      this.commentedAt.hashCode ^
      this.likeCount.hashCode ^
      this.dislikeCount.hashCode;
}
