import 'package:flutter/material.dart';

import 'package:metube/ui/widgets/widgets.dart';

class SubscriptionsScreen extends StatefulWidget {
  @override
  _SubscriptionsScreenState createState() => _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends State<SubscriptionsScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, position) {
        return MeTubeCard('subscriptions', position: position);
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
