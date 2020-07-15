import 'package:flutter/material.dart';

class AppBarMenuTileWidget extends StatelessWidget {
  const AppBarMenuTileWidget({
    Key key,
    @required this.trailingIcon,
    @required this.title,
    this.subtitle,
    this.trailingIconColor = Colors.white,
    this.titleColor = Colors.white,
    this.subtitleColor = Colors.white,
  }) : super(key: key);

  final IconData trailingIcon;
  final String title;
  final String subtitle;
  final Color trailingIconColor;
  final Color titleColor;
  final Color subtitleColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Icon(
            this.trailingIcon,
            color: this.trailingIconColor,
          ),
          const SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                this.title,
                style: TextStyle(
                  color: this.titleColor,
                ),
              ),
              this.subtitle != null
                  ? Text(
                      this.subtitle,
                      style: TextStyle(
                        color: this.subtitleColor,
                        fontSize: 11,
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
