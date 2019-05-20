import 'package:flutter/material.dart';

class InboxScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TabBar(
          labelColor: Colors.black54,
          indicatorColor: Colors.black87,
          tabs: [
            Tab(text: 'MESSAGES'),
            Tab(text: 'NOTIFICATIONS'),
          ],
        ),
        body: TabBarView(
          children: [
            Icon(Icons.message),
            Icon(Icons.notifications),
          ],
        ),
      ),
    );
  }
}
