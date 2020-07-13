import 'package:flutter/material.dart';

class BottomCardWidget extends StatelessWidget {
  const BottomCardWidget({
    Key key,
    this.textStyle,
    @required this.cardIcon,
    @required this.cardText,
    this.cardColor,
  }) : super(key: key);

  final TextStyle textStyle;
  final IconData cardIcon;
  final String cardText;
  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: this.cardColor,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        width: 100,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(
              this.cardIcon,
              color: Colors.white,
            ),
            Text(
              this.cardText,
              style: textStyle ??
                  Theme.of(context).textTheme.bodyText2.copyWith(
                        color: Colors.white,
                        height: 1.1,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
