import 'package:flutter/material.dart';

import 'package:metube/model/model.dart';
import 'package:metube/repository/repository.dart';
import 'package:metube/ui/widgets/widgets.dart';

class SubscriptionsScreen extends StatefulWidget {
  @override
  _SubscriptionsScreenState createState() => _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends State<SubscriptionsScreen> {
  List<Video> videoList;

  @override
  void initState() {
    super.initState();
    VideoRepository.get().getAllVideos().then((list) {
      setState(() {
        videoList = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videoList.length,
      itemBuilder: (context, position) {
        return MeTubeCard(videoList[position]);
      },
    );
  }
}
