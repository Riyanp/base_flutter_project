import 'package:base_flutter_project/components/text_widget.dart';
import 'package:base_flutter_project/core/theme.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onClick;
  final double? height;
  final TypographyToken? typographyToken;
  final double? elevation;
  final bool isSecondary;
  final bool isRounded;

  const PrimaryButton({
    Key? key,
    required this.onClick,
    required this.text,
    this.height,
    this.typographyToken,
    this.elevation,
    this.isSecondary = false,
    this.isRounded = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(isRounded ? 4 : 0),
            ),
            side: BorderSide(
              color: AppThemes.primarySwatch,
              width: isSecondary ? 1 : 0,
            ),
          ),
          elevation: elevation,
          minimumSize: Size.fromHeight(height ?? 48.0),
          maximumSize: Size.fromHeight(height ?? 48.0),
          backgroundColor: isSecondary ? Colors.white : AppThemes.primarySwatch),
      child: TextWidget(
        text,
        color: isSecondary ? AppThemes.primarySwatch : Colors.white,
        typographyToken: typographyToken != null
            ? typographyToken!
            : TypographyToken.text14SemiBold,
      ),
      onPressed: () => onClick != null ? onClick!.call() : null,
    );
  }
}
