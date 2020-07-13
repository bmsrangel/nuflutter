import 'package:flutter/material.dart';

class CreditCardValueWidget extends StatelessWidget {
  const CreditCardValueWidget({
    Key key,
    @required this.textStyle,
    this.creditCardValue,
  }) : super(key: key);

  final TextStyle textStyle;
  final String creditCardValue;

  @override
  Widget build(BuildContext context) {
    List<String> splittedCreditCardValue = this.creditCardValue.split(",");

    return RichText(
      text: TextSpan(text: "R\$ ", style: textStyle, children: [
        TextSpan(
          text: "${splittedCreditCardValue[0]}",
          style: textStyle.copyWith(
            fontWeight: FontWeight.w800,
          ),
        ),
        TextSpan(text: ",${splittedCreditCardValue[1]}", style: textStyle),
      ]),
    );
  }
}
