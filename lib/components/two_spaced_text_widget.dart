import 'package:flutter/material.dart';
import 'package:base_flutter_project/core/extensions/string_ext.dart';
import 'package:base_flutter_project/components/text_widget.dart';

class TwoSpacedTextWidget extends StatelessWidget {
  final String? leftText;
  final String? rightText;
  final TypographyToken? leftToken;
  final TypographyToken? rightToken;
  final Color? leftColor;
  final Color? rightColor;

  const TwoSpacedTextWidget({
    Key? key,
    required this.leftText,
    required this.rightText,
    this.leftToken,
    this.rightToken,
    this.leftColor,
    this.rightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextWidget(
            leftText.orEmpty,
            color: leftColor,
            typographyToken: leftToken ?? TypographyToken.text10,
          ),
          const Spacer(),
          (rightText?.length ?? 0) > 30
              ? Expanded(
                  child: TextWidget(
                    rightText.orEmpty,
                    maxLines: 4,
                    color: rightColor,
                    textAlign: TextAlign.end,
                    typographyToken:
                        rightToken ?? TypographyToken.text10SemiBold,
                  ),
                )
              : TextWidget(
                  rightText.orEmpty,
                  color: rightColor,
                  typographyToken: rightToken ?? TypographyToken.text10SemiBold,
                )
        ],
      ),
    );
  }
}
