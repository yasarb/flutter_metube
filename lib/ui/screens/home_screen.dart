import 'package:flutter/material.dart';

import 'package:metube/repository/repository.dart';
import 'package:metube/model/model.dart';
import 'package:metube/ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Video> _videoList = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Video>>(
      future: VideoRepository.get().getAllVideos(),
      builder: (BuildContext context, AsyncSnapshot<List<Video>> snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, position) {
                return MeTubeCard(snapshot.data[position]);
              });
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
