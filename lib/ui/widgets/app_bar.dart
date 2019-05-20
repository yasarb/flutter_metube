import 'package:flutter/material.dart';

class MeTubeAppBar {
  AppBar getAppBar() {
    return AppBar(
      title: _getTitle(),
      backgroundColor: Colors.white,
      actions: _buildButtons(),
    );
  }

  Widget _getTitle() {
    return Text(
      'MeTube',
      style: _getTitleStyle(),
    );
  }

  TextStyle _getTitleStyle() {
    return TextStyle(
      color: Colors.black,
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.w700,
    );
  }

  List<Widget> _buildButtons() {
    var cameraBtn = IconButton(
      icon: new Icon(Icons.videocam),
      color: Colors.black,
      onPressed: () {},
    );

    var searchButton = IconButton(
      icon: new Icon(Icons.search),
      color: Colors.black,
      onPressed: () {},
    );

    var profileBtn = Container(
      child: IconButton(
        icon: new Icon(Icons.person),
        color: Colors.black,
        onPressed: () {},
      ),
    );

    return [cameraBtn, searchButton, profileBtn];
  }
}
