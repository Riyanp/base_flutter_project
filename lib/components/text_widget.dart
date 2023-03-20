import 'package:base_flutter_project/components/typography.dart';
import 'package:base_flutter_project/core/extensions/string_ext.dart';
import 'package:flutter/material.dart';

export 'package:base_flutter_project/components/typography.dart';

class TextWidget extends StatelessWidget {
  final String? text;
  final EdgeInsets? padding;
  final TypographyToken typographyToken;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? textDecoration;

  const TextWidget(
    this.text, {
    Key? key,
    this.typographyToken = TypographyToken.text14,
    this.padding,
    this.color,
    this.textAlign,
    this.maxLines = 1,
    this.overflow,
    this.textDecoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Text(
        text.orEmpty,
        textAlign: textAlign,
        maxLines: maxLines,
        overflow: overflow,
        style: TextStyle(
          color: color ?? Colors.black,
          fontSize: typographyToken.fontSize,
          fontFamily: typographyToken.fontFamily,
          fontWeight: typographyToken.fontWeight,
          decoration: textDecoration,
        ),
      ),
    );
  }
}
