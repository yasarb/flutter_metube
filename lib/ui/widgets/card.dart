import 'dart:math';
import 'package:flutter/material.dart';

enum PopMenuKey { notInterested, saveToWatchLater, saveToPlaylist, share, report }

class MeTubeCard extends StatelessWidget {
  final String tabKey;
  final int position;
  final String videoId;
  final String thumbnailUrl;
  final String userPhotoUrl;
  final String title;
  final String channel;
  final int viewerCount;
  final String uploadedTime;
  final int durationInSec;

  MeTubeCard(
    this.tabKey, {
    this.position,
    this.videoId,
    this.thumbnailUrl,
    this.userPhotoUrl,
    this.title,
    this.channel,
    this.viewerCount,
    this.uploadedTime,
    this.durationInSec,
  });

  final videoTitleStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w700,
    fontSize: 16,
  );

  final videoSubTitleStyle = TextStyle(
    color: Colors.black45,
    fontWeight: FontWeight.w600,
    fontSize: 14,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          _buildThumbnail(),
          _buildInfo(),
        ],
      ),
    );
  }

  Widget _buildThumbnail() {
    var imageUrl = getImageUrl();

    var thumbnailImage = Container(
      height: 232,
      child: Image.asset(
        imageUrl,
        fit: BoxFit.fitHeight,
      ),
    );

    var durationText = Text(
      '5:56',
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
    );

    var duration = Positioned(
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

    return Stack(
      children: <Widget>[
        thumbnailImage,
        duration,
      ],
    );
  }

  String getImageUrl() {
    String imageUrl = '';
    var rng = new Random();
    var imageUrls = [
      'assets/images/thumbnail_1.png',
      'assets/images/thumbnail_2.jpg',
      'assets/images/thumbnail_3.jpg',
      'assets/images/thumbnail_4.jpg',
      'assets/images/thumbnail_5.jpg',
      'assets/images/thumbnail_6.jpg'
    ];

    return imageUrls[rng.nextInt(imageUrls.length)];
  }

  _buildInfo() {
    var channelImage = Container(
      width: 45.0,
      height: 45.0,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        image: new DecorationImage(
          fit: BoxFit.fill,
          image: new AssetImage('assets/images/channel.jpg'),
        ),
      ),
    );

    // Image.asset('assets/images/channel.jpg');

    var info = Container(
      padding: EdgeInsets.only(
        left: 10,
        top: 5,
      ),
      height: 70,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          channelImage,
          SizedBox(
            width: 10,
          ),
          Container(
            width: 310,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('How to make a thumbnail!', style: videoTitleStyle),
                Text('PewDiePie - 1M views - 1 months ago', style: videoSubTitleStyle),
              ],
            ),
          ),
        ],
      ),
    );

    var popup = Positioned(
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

    return Stack(
      children: <Widget>[
        info,
        popup,
      ],
    );
  }
}
