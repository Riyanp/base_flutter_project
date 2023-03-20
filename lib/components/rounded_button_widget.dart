import 'package:base_flutter_project/components/clickable_card_widget.dart';
import 'package:base_flutter_project/components/text_widget.dart';
import 'package:base_flutter_project/core/theme.dart';
import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final Function onTap;
  final String text;

  const RoundedButtonWidget({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClickableCardWidget(
      cardColor: AppThemes.primarySwatch,
      cardRadius: 10,
      onTap: () => onTap.call(),
      child: Padding(
        padding: const EdgeInsets.only(top: 9, bottom: 9),
        child: Row(
          children: [
            const SizedBox(width: 30),
            TextWidget(
              text,
              typographyToken: TypographyToken.text14SemiBold,
              color: Colors.white,
            ),
            const Spacer(),
            const Icon(
              Icons.chevron_right,
              color: Colors.white,
            ),
            const SizedBox(width: 16),
          ],
        ),
      ),
    );
  }
}
