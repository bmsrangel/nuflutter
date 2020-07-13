import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key key,
    @required this.screenWidth,
    this.body,
    this.footer,
    this.onPressed,
    this.title,
  }) : super(key: key);

  final double screenWidth;
  final Widget title;
  final Widget body;
  final Widget footer;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
        width: this.screenWidth,
        height: this.screenWidth - 50,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
              child: this.title,
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                alignment: Alignment.centerLeft,
                child: this.body,
              ),
            ),
            this.footer != null
                ? Material(
                    color: Color(0xFFF7F7F7),
                    child: InkWell(
                      onTap: this.onPressed,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        width: this.screenWidth - 40.0,
                        height: this.screenWidth * .25,
                        child: this.footer,
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
