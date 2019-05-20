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
    var homeItem = _buildHomeItem();
    var trendingsItem = _buildTrendingsItem();
    var subsItem = _buildSubsItem();
    var inboxItem = _buildInboxItem();
    var libraryItem = _buildLibraryItem();

    return BottomNavigationBar(
      currentIndex: currentSelectedIndex,
      type: BottomNavigationBarType.fixed,
      fixedColor: Colors.red,
      onTap: (index) => {this.onItemTapped(index)},
      items: <BottomNavigationBarItem>[
        homeItem,
        trendingsItem,
        subsItem,
        inboxItem,
        libraryItem,
      ],
    );
  }

  BottomNavigationBarItem _buildHomeItem() {
    return BottomNavigationBarItem(
      icon: new Icon(Icons.home),
      title: new Text(
        'Home',
        style: _tabTextStyle,
      ),
    );
  }

  BottomNavigationBarItem _buildTrendingsItem() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.trending_up),
      title: Text(
        'Trendings',
        style: _tabTextStyle,
      ),
    );
  }

  BottomNavigationBarItem _buildSubsItem() {
    return BottomNavigationBarItem(
        icon: Icon(Icons.subscriptions),
        title: Text(
          'Subscriptions',
          style: _tabTextStyle,
        ));
  }

  BottomNavigationBarItem _buildInboxItem() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.inbox),
      title: Text(
        'Inbox',
        style: _tabTextStyle,
      ),
    );
  }

  BottomNavigationBarItem _buildLibraryItem() {
    return BottomNavigationBarItem(
      icon: Icon(Icons.folder),
      title: Text(
        'Library',
        style: _tabTextStyle,
      ),
    );
  }
}
