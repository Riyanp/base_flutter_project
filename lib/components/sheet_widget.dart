import 'package:base_flutter_project/components/primary_button.dart';
import 'package:base_flutter_project/components/text_widget.dart';
import 'package:flutter/material.dart';

class SheetWidget extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final VoidCallback buttonAction;

  const SheetWidget(
      {Key? key,
      required this.title,
      required this.description,
      required this.buttonText,
      required this.buttonAction})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                TextWidget(title, typographyToken: TypographyToken.title24),
                TextWidget(
                  description,
                  typographyToken: TypographyToken.text14,
                  padding: const EdgeInsets.all(16),
                ),
                PrimaryButton(
                    text: buttonText, onClick: () => buttonAction.call()),
                const SizedBox(height: 24)
              ],
            ))
      ],
    );
  }
}
