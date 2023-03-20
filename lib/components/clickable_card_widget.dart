import 'package:flutter/material.dart';

class ClickableCardWidget extends StatelessWidget {
  final Widget child;
  final Function? onTap;
  final Color? cardColor;
  final double? elevation;
  final Color? strokeColor;
  final double? strokeWidth;
  final EdgeInsetsGeometry? margin;
  final double? cardRadius;

  const ClickableCardWidget({
    Key? key,
    required this.child,
    this.onTap,
    this.cardColor,
    this.elevation,
    this.strokeColor,
    this.strokeWidth,
    this.margin,
    this.cardRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: cardColor ?? Colors.white,
      elevation: elevation ?? 0,
      margin: margin ?? EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(cardRadius ?? 0),
        side: BorderSide(
          color: strokeColor ?? (cardColor ?? Colors.white),
          width: strokeWidth ?? 0,
        ),
      ),
      child: InkWell(
          onTap: () {
            onTap?.call();
          },
          child: child),
    );
  }
}
