import 'package:flutter/material.dart';

class AccountInfoTextWidget extends StatelessWidget {
  const AccountInfoTextWidget({
    Key key,
    @required this.textStyle,
    this.regularText,
    this.boldText,
  }) : super(key: key);

  final TextStyle textStyle;
  final String regularText;
  final String boldText;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: "${this.regularText} ",
        style: textStyle,
        children: [
          TextSpan(
            text: this.boldText,
            style: textStyle.copyWith(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
