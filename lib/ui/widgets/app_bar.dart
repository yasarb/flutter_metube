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
    return Container(
      child: Row(
        children: <Widget>[
          _getLogo(),
          SizedBox(
            width: 8,
          ),
          Text(
            'MeTube',
            style: _getTitleStyle(),
          )
        ],
      ),
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
      icon: Icon(Icons.videocam),
      color: Colors.black,
      onPressed: () {},
    );

    var searchButton = IconButton(
      icon: Icon(Icons.search),
      color: Colors.black,
      onPressed: () {},
    );

    var profileBtn = _buildProfileButton();

    return [cameraBtn, searchButton, profileBtn];
  }

  Widget _buildProfileButton() {
    // todo var image = AssetImage('assets/images/mock_profile_photo.jpg');

    return IconButton(
      icon: Icon(Icons.person),
      color: Colors.black,
      onPressed: () {},
    );
  }

  Widget _getLogo() {
    return Transform.scale(
      scale: 1.75,
      child: Icon(
        Icons.fast_forward,
        color: Colors.red,
      ),
    );
  }
}
