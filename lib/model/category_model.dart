import 'package:flutter/widgets.dart';
import 'package:uuid/uuid.dart';

import 'package:metube/model/video_model.dart';

class Category {
  final String _id;
  final String name;
  final Icon icon;
  final List<Video> videoList;

  Category(this.name, this.icon, this.videoList) : this._id = (new Uuid()).v4();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Category &&
          this._id == other._id &&
          this.name == other.name &&
          this.icon == other.icon &&
          this.videoList == other.videoList);

  @override
  int get hashCode =>
      this._id.hashCode ^ this.name.hashCode ^ this.icon.hashCode ^ this.videoList.hashCode;
}
