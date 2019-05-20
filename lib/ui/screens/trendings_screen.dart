import 'package:flutter/material.dart';

import 'package:metube/ui/widgets/widgets.dart';

class TrendingsScreen extends StatefulWidget {
  @override
  _TrendingsScreenState createState() => _TrendingsScreenState();
}

class _TrendingsScreenState extends State<TrendingsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, position) {
        return MeTubeCard('trendings', position: position);
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
