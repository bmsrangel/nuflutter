import 'package:flutter/material.dart';

class CustomAppBarWidget extends StatefulWidget {
  const CustomAppBarWidget({
    Key key,
    @required this.userFirstName,
    this.textStyle,
    this.children,
    this.screenSize,
    this.onExpansionChanged,
    this.controller,
  })  : assert(userFirstName != null,
            "The field 'userFirstName' must be provided."),
        super(key: key);

  final String userFirstName;
  final TextStyle textStyle;
  final List<Widget> children;
  final Size screenSize;
  final ValueChanged<bool> onExpansionChanged;
  final AnimationController controller;

  @override
  _CustomAppBarWidgetState createState() => _CustomAppBarWidgetState();
}

class _CustomAppBarWidgetState extends State<CustomAppBarWidget> {
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
    this._heightFactor = widget.controller.drive(_easeInTween);
    this._iconTurns = widget.controller.drive(_halfTween.chain(_easeInTween));
    this._opacity = widget.controller.drive(_opacityTween.chain(_easeInTween));
  }

  @override
  void dispose() {
    super.dispose();
    this.widget.controller.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        widget.controller.forward();
      } else {
        widget.controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
    });
    if (widget.onExpansionChanged != null) {
      widget.onExpansionChanged(_isExpanded);
    }
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
            heightFactor: this._heightFactor.value,
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
    final bool closed = !_isExpanded && widget.controller.isDismissed;
    return AnimatedBuilder(
      animation: this.widget.controller.view,
      builder: _buildChildren,
      child: closed
          ? null
          : Column(
              children: widget.children,
            ),
    );
  }
}
