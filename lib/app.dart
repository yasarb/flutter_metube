import 'package:flutter/material.dart';

import 'package:metube/ui/ui.dart';

class MeTubeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MeTube',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TabbedScreen(),
    );
  }
}
