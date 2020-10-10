import 'package:flutter/material.dart';

class ScreenTemplate extends StatelessWidget {

  final Widget widget;
  final bool topPadding;
  final bool bottomPadding;
  final bool leftPadding;
  final bool rightPadding;

  ScreenTemplate(
    this.widget,
    {
      this.topPadding = false,
      this.bottomPadding = false,
      this.leftPadding = false,
      this.rightPadding = false
    }
  );
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.only(
          top: topPadding ? 20 : 0,        
          bottom: bottomPadding ? 55 : 0,
          left: leftPadding ? 10 : 0,
          right: rightPadding ? 10 : 0,
        ),
        child: widget,
      ),
    );
  }
}