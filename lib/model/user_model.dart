import 'package:uuid/uuid.dart';

import 'package:metube/models/video_model.dart';

class User {
  final String _id;
  final String name;
  final String imageUrl;
  final String bannerUrl;
  final int subscriberCount;
  final List<Video> videoList;
  final List<User> subscriptionList;

  User(
    this.name,
    this.imageUrl,
    this.bannerUrl,
    this.subscriberCount,
    this.videoList,
    this.subscriptionList,
  ) : this._id = (new Uuid()).v4();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          this._id == other._id &&
          this.name == other.name &&
          this.imageUrl == other.imageUrl &&
          this.bannerUrl == other.bannerUrl &&
          this.subscriberCount == other.subscriberCount &&
          this.videoList == other.videoList &&
          this.subscriptionList == other.subscriptionList);

  @override
  int get hashCode =>
      this._id.hashCode ^
      this.name.hashCode ^
      this.imageUrl.hashCode ^
      this.bannerUrl.hashCode ^
      this.subscriberCount.hashCode ^
      this.videoList.hashCode ^
      this.subscriptionList.hashCode;
}
