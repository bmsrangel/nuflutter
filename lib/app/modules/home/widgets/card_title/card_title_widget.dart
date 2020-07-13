import 'package:flutter/material.dart';

class CardTitleWidget extends StatelessWidget {
  const CardTitleWidget({
    Key key,
    @required this.textStyle,
    this.leadingIcon,
    this.text,
  })  : assert(text != null, "A text must be provided"),
        assert(leadingIcon != null, "An icon must be provided"),
        super(key: key);

  final TextStyle textStyle;
  final IconData leadingIcon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          this.leadingIcon,
          color: Color(0xFF555555),
        ),
        const SizedBox(width: 15.0),
        Text(
          this.text,
          style: textStyle,
        )
      ],
    );
  }
}
