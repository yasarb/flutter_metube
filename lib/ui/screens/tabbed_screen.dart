import 'package:flutter/material.dart';

import 'package:metube/ui/widgets/widgets.dart';

class TabbedScreen extends StatefulWidget {
  @override
  _TabbedScreenState createState() => _TabbedScreenState();
}

class _TabbedScreenState extends State<TabbedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeTubeAppBar().getAppBar(),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('MeTube'),
    );
  }
}
