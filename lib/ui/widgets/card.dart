import 'dart:math';
import 'package:flutter/material.dart';

import 'package:metube/model/model.dart';

enum PopMenuKey { notInterested, saveToWatchLater, saveToPlaylist, share, report }

class MeTubeCard extends StatelessWidget {
  final Video video;

  MeTubeCard(this.video);

  @override
  Widget build(BuildContext context) {
    var textWidth = MediaQuery.of(context).size.width * 0.7;

    var durationText = Text(
      '5:56',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );

    return Container(
      child: Column(
        children: <Widget>[
          _Thumbnail(
            thumbnailImage: _ThumbnailImage(imageUrl: video.thumbnailUrl),
            duration: _Duration(durationText: durationText),
          ),
          Stack(
            children: <Widget>[
              _VideoCardInfo(video),
              _VideoCardPopupMenu(),
            ],
          ),
        ],
      ),
    );
  }
}

class _VideoCardPopupMenu extends StatelessWidget {
  const _VideoCardPopupMenu({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0.0,
      right: 0.0,
      child: PopupMenuButton<PopMenuKey>(
        onSelected: (PopMenuKey result) {
          print(result);
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<PopMenuKey>>[
              const PopupMenuItem<PopMenuKey>(
                value: PopMenuKey.notInterested,
                child: Text('Not interested'),
              ),
              const PopupMenuItem<PopMenuKey>(
                value: PopMenuKey.saveToWatchLater,
                child: Text('Save to Watch later'),
              ),
              const PopupMenuItem<PopMenuKey>(
                value: PopMenuKey.saveToPlaylist,
                child: Text('Save to playlist'),
              ),
              const PopupMenuItem<PopMenuKey>(
                value: PopMenuKey.share,
                child: Text('Share'),
              ),
              const PopupMenuItem<PopMenuKey>(
                value: PopMenuKey.report,
                child: Text('Report'),
              ),
            ],
      ),
    );
  }
}

class _ChannelImage extends StatelessWidget {
  final Video video;

  const _ChannelImage(
    this.video, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45.0,
      height: 45.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: new AssetImage(video.thumbnailUrl),
        ),
      ),
    );
  }
}

class _VideoCardInfo extends StatelessWidget {
  final Video video;

  const _VideoCardInfo(
    this.video, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: 10,
        top: 5,
      ),
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _ChannelImage(video),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: _VideoCardHeader(video),
          ),
        ],
      ),
    );
  }
}

class _VideoCardHeader extends StatelessWidget {
  static const videoTitleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  static const videoSubTitleStyle = TextStyle(
    color: Colors.black45,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  final Video video;

  const _VideoCardHeader(
    this.video, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textWidth = MediaQuery.of(context).size.width * 0.7;

    return Container(
      width: textWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            video.title,
            style: videoTitleStyle,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            video.description,
            style: videoSubTitleStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _Duration extends StatelessWidget {
  const _Duration({
    Key key,
    @required this.durationText,
  }) : super(key: key);

  final Text durationText;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10.0,
      right: 10.0,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(3),
          child: durationText,
        ),
      ),
    );
  }
}

class _ThumbnailImage extends StatelessWidget {
  const _ThumbnailImage({
    Key key,
    @required this.imageUrl,
  }) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 232,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}

class _Thumbnail extends StatelessWidget {
  final _ThumbnailImage thumbnailImage;
  final _Duration duration;

  const _Thumbnail({
    Key key,
    @required this.thumbnailImage,
    @required this.duration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        thumbnailImage,
        duration,
      ],
    );
  }
}
