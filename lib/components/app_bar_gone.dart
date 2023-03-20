import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarGone extends StatelessWidget implements PreferredSizeWidget {
  final bool showWhiteStatusBar;

  const AppBarGone({
    Key? key,
    required this.showWhiteStatusBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness:
              showWhiteStatusBar ? Brightness.light : Brightness.dark),
      backgroundColor:
          showWhiteStatusBar ? Colors.white : Colors.transparent,
      elevation: 0,
      bottomOpacity: 0,
      toolbarOpacity: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);
}
