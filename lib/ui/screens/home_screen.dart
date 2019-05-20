import 'package:flutter/material.dart';

import 'package:metube/ui/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, position) {
        return MeTubeCard(position: position);
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
