import 'dart:io';

import 'package:base_flutter_project/app.dart';
import 'package:base_flutter_project/core/app_config.dart';
import 'package:base_flutter_project/core/constants.dart';
import 'package:base_flutter_project/core/extensions/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await dotenv.load(fileName: "develop.env");
  if (!AppConfig.isWeb) {
    if (Platform.isAndroid) {
      await FlutterDisplayMode.setHighRefreshRate();
    }
  }

  // uncomment if using firebase service.
  /*await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/

  AppConfig.appFlavor = Flavor.DEVELOPMENT;
  runApp(MyApp(accessToken: prefs.getString(Constants.accessToken).orEmpty));
}
