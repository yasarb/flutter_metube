import 'package:flutter/material.dart';

class MeTubeAppBar {
  AppBar getAppBar() {
    return AppBar(
      title: TitleWithLogo(),
      backgroundColor: Colors.white,
      actions: [
        const _VideoIconButton(),
        const _SearchIconButton(),
        const _PersonIconButton(),
      ],
    );
  }
}

class _SearchIconButton extends StatelessWidget {
  const _SearchIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      color: Colors.black,
      onPressed: () {},
    );
  }
}

class _VideoIconButton extends StatelessWidget {
  const _VideoIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.videocam),
      color: Colors.black,
      onPressed: () {},
    );
  }
}

class _PersonIconButton extends StatelessWidget {
  const _PersonIconButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.person),
      color: Colors.black,
      onPressed: () {},
    );
  }
}

class TitleWithLogo extends StatelessWidget {
  const TitleWithLogo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Transform.scale(
            scale: 1.75,
            child: Icon(
              Icons.fast_forward,
              color: Colors.red,
            ),
          ),
          SizedBox(
            width: 8,
          ),
          const Text(
            'MeTube',
            style: TextStyle(
              color: Colors.black,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
