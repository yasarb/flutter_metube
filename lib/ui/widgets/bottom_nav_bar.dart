import 'package:flutter/material.dart';

class MeTubeBottomNavigationBar extends StatelessWidget {
  final _tabTextStyle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: Colors.black54,
  );
  final int currentSelectedIndex;
  final Function onItemTapped;

  MeTubeBottomNavigationBar(this.currentSelectedIndex, this.onItemTapped)
      : assert(onItemTapped != null);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentSelectedIndex,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.red,
      onTap: (index) => {this.onItemTapped(index)},
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: new Icon(Icons.home),
          title: new Text(
            'Home',
            style: _tabTextStyle,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up),
          title: Text(
            'Trendings',
            style: _tabTextStyle,
          ),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions),
            title: Text(
              'Subscriptions',
              style: _tabTextStyle,
            )),
        BottomNavigationBarItem(
          icon: Icon(Icons.inbox),
          title: Text(
            'Inbox',
            style: _tabTextStyle,
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.folder),
          title: Text(
            'Library',
            style: _tabTextStyle,
          ),
        ),
      ],
    );
  }
}
