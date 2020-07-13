import 'package:flutter/material.dart';

const Duration _kExpand = Duration(milliseconds: 300);

class CustomAppBarWidget extends StatefulWidget {
  const CustomAppBarWidget({
    Key key,
    @required this.userFirstName,
    this.textStyle,
    this.children,
  })  : assert(userFirstName != null,
            "The field 'userFirstName' must be provided."),
        super(key: key);

  final String userFirstName;
  final TextStyle textStyle;
  final List<Widget> children;

  @override
  _CustomAppBarWidgetState createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);
  static final Animatable<double> _opacityTween =
      Tween<double>(begin: 0.0, end: 1.0);

  Animation<double> _iconTurns;
  Animation<double> _heightFactor;
  Animation<double> _opacity;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    this._controller = AnimationController(vsync: this, duration: _kExpand);
    this._heightFactor = _controller.drive(_easeInTween);
    this._iconTurns = _controller.drive(_halfTween.chain(_easeInTween));
    this._opacity = _controller.drive(_opacityTween.chain(_easeInTween));
  }

  @override
  void dispose() {
    super.dispose();
    this._controller.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
    });
  }

  Widget _buildChildren(BuildContext context, Widget child) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: _handleTap,
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    "images/flutter_logo_outlined.png",
                    height: 40,
                  ),
                  const SizedBox(width: 10),
                  Text(this.widget.userFirstName, style: this.widget.textStyle),
                ],
              ),
              RotationTransition(
                turns: this._iconTurns,
                child: Icon(
                  Icons.expand_more,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        ClipRect(
          child: Align(
            heightFactor: _heightFactor.value,
            child: Opacity(
              opacity: this._opacity.value,
              child: child,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    return AnimatedBuilder(
      animation: this._controller.view,
      builder: _buildChildren,
      child: closed ? null : Column(children: widget.children),
    );
  }
}
