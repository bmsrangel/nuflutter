import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key key,
    @required this.screenWidth,
    this.body,
    this.footer,
  }) : super(key: key);

  final double screenWidth;
  final Widget body;
  final Widget footer;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
          width: this.screenWidth,
          height: this.screenWidth - 50,
          color: Colors.white,
          child: this.body,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            width: this.screenWidth - 40.0,
            height: this.screenWidth * .25,
            color: Color(0xFFF7F7F7),
            child: this.footer,
          ),
        ),
      ],
    );
  }
}
