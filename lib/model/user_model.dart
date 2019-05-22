import 'package:uuid/uuid.dart';

import 'package:metube/models/video_model.dart';

class User {
  static final String db_id = 'id';
  static final String db_name = 'name';
  static final String db_imageUrl = 'imageUrl';
  static final String db_bannerUrl = 'bannerUrl';
  static final String db_subscriberCount = 'subscriberCount';

  // static final String db_videoList = 'videoList';
  // static final String db_subscriptionList = 'subscriptionList';

  int id;
  final String name;
  final String imageUrl;
  final String bannerUrl;
  final int subscriberCount;
  final List<Video> videoList;
  final List<User> subscriptionList;

  User({
    this.id,
    this.name,
    this.imageUrl,
    this.bannerUrl,
    this.subscriberCount,
    this.videoList,
    this.subscriptionList,
  });

  User.fromMap(Map<String, dynamic> map)
      : this(
          id: map[db_id],
          name: map[db_name],
          imageUrl: map[db_imageUrl],
          bannerUrl: map[db_bannerUrl],
          subscriberCount: map[db_subscriberCount],
        );

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      db_name: this.name,
      db_imageUrl: this.imageUrl,
      db_bannerUrl: this.bannerUrl,
      db_subscriberCount: this.subscriberCount,
    };

    if (id != null) {
      map[db_id] = this.id;
    }
    return map;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          this.id == other.id &&
          this.name == other.name &&
          this.imageUrl == other.imageUrl &&
          this.bannerUrl == other.bannerUrl &&
          this.subscriberCount == other.subscriberCount &&
          this.videoList == other.videoList &&
          this.subscriptionList == other.subscriptionList);

  @override
  int get hashCode =>
      this.id.hashCode ^
      this.name.hashCode ^
      this.imageUrl.hashCode ^
      this.bannerUrl.hashCode ^
      this.subscriberCount.hashCode ^
      this.videoList.hashCode ^
      this.subscriptionList.hashCode;
}
