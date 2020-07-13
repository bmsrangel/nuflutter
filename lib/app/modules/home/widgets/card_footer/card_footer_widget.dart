import 'package:flutter/material.dart';

class CardFooterWidget extends StatelessWidget {
  const CardFooterWidget({
    Key key,
    this.textStyle,
    @required this.leadingIcon,
    @required this.text,
    this.onPressed,
  }) : super(key: key);

  final TextStyle textStyle;
  final IconData leadingIcon;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          this.leadingIcon,
          color: Color(0xFF777777),
        ),
        const SizedBox(width: 20.0),
        Expanded(
          child: Text(
            this.text,
            textAlign: TextAlign.justify,
            style: textStyle,
          ),
        ),
        const SizedBox(width: 30.0),
        Icon(
          Icons.keyboard_arrow_right,
          size: 18,
        ),
      ],
    );
  }
}
