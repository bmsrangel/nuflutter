import 'package:flutter/material.dart';

class CardButtonWidget extends StatelessWidget {
  const CardButtonWidget({
    Key key,
    this.onPressed,
    this.child,
    this.borderColor = const Color(0xFFCCCCCC),
  }) : super(key: key);

  final Function onPressed;
  final Widget child;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      onPressed: this.onPressed,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: this.child,
      padding: EdgeInsets.zero,
      borderSide: BorderSide(color: this.borderColor, width: 1.5),
    );
  }
}
