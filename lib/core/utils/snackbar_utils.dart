import 'package:base_flutter_project/app.dart';
import 'package:base_flutter_project/components/text_widget.dart';
import 'package:flutter/material.dart';

enum SnackbarType { ERROR, INFO }

class SnackBarUtils {
  SnackBarUtils(
      {required this.context,
      required this.message,
      this.type = SnackbarType.INFO});

  final BuildContext context;
  final String message;
  final SnackbarType type;

  void show() async {
    rootScaffoldMessengerKey.currentState?.showSnackBar(SnackBar(
      content: TextWidget(message, color: Colors.white),
      behavior: SnackBarBehavior.floating,
      backgroundColor: type == SnackbarType.ERROR
          ? Theme.of(context).errorColor
          : Theme.of(context).primaryColor,
    ));
  }
}
