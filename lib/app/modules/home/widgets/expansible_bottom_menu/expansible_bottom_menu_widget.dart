import 'package:flutter/material.dart';

class ExpansibleBottomMenuWidget extends StatefulWidget {
  final bool isExpanded;
  final Widget child;
  final AnimationController controller;

  const ExpansibleBottomMenuWidget(
      {Key key, this.isExpanded, this.child, this.controller})
      : super(key: key);

  @override
  _ExpansibleBottomMenuWidgetState createState() =>
      _ExpansibleBottomMenuWidgetState();
}

class _ExpansibleBottomMenuWidgetState
    extends State<ExpansibleBottomMenuWidget> {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _heightTween =
      Tween<double>(begin: 0.0, end: 1.0);
  static final Animatable<double> _opacityTween =
      Tween<double>(begin: 0.0, end: 1.0);

  Animation<double> _heightFactor;
  Animation<double> _opacityFactor;

  @override
  void initState() {
    this._heightFactor = ReverseAnimation(
        this.widget.controller.drive(_heightTween.chain(_easeInTween)));
    this._opacityFactor = ReverseAnimation(
        this.widget.controller.drive(_opacityTween.chain(_easeInTween)));
    super.initState();
  }

  @override
  void didUpdateWidget(ExpansibleBottomMenuWidget oldWidget) {
    if (widget.isExpanded != oldWidget.isExpanded) {
      this._handleAnimation();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    this.widget.controller.dispose();
    super.dispose();
  }

  void _handleAnimation() {
    setState(() {
      if (widget.isExpanded) {
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
  }

  Widget _buildChild(BuildContext context, Widget child) {
    return ClipRect(
      child: Align(
        heightFactor: this._heightFactor.value,
        child: Opacity(
          opacity: this._opacityFactor.value,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed =
        !this.widget.isExpanded && widget.controller.isDismissed;
    return AnimatedBuilder(
      animation: this.widget.controller.view,
      builder: this._buildChild,
      child: closed ? widget.child : null,
    );
  }
}
