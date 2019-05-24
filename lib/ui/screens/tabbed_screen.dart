import 'package:flutter/material.dart';

import 'package:metube/ui/screens/screens.dart';
import 'package:metube/ui/widgets/widgets.dart';

class TabbedScreen extends StatefulWidget {
  @override
  _TabbedScreenState createState() => _TabbedScreenState();
}

class _TabbedScreenState extends State<TabbedScreen> {
  int _selectedTabIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    //TODO TrendingsScreen(),
    //TODO SubscriptionsScreen(),
    //TODO InboxScreen(),
    Text(
      'Index 4: Library',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MeTubeAppBar().getAppBar(),
      bottomNavigationBar: MeTubeBottomNavigationBar(_selectedTabIndex, _onItemTapped),
      body: Center(
        child: _widgetOptions.elementAt(_selectedTabIndex),
      ),
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
