import 'package:base_flutter_project/core/extensions/string_ext.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

enum Flavor {
  DEVELOPMENT,
  STAGING,
  PRODUCTION,
}

class AppConfig {
  static Flavor appFlavor = Flavor.DEVELOPMENT;

  static bool get isWeb {
    return kIsWeb;
  }

  static String get apiUrl {
    switch (appFlavor) {
      case Flavor.STAGING:
        return dotenv.env['BASE_URL_STAGING'].orEmpty;
      case Flavor.PRODUCTION:
        return dotenv.env['BASE_URL'].orEmpty;
      case Flavor.DEVELOPMENT:
      default:
        return dotenv.env['BASE_URL_DEV'].orEmpty;
    }
  }

  static String get flavorName {
    switch (appFlavor) {
      case Flavor.STAGING:
        return "STAGING";
      case Flavor.PRODUCTION:
        return "PRODUCTION";
      case Flavor.DEVELOPMENT:
      default:
        return "DEV";
    }
  }

  static String get clientId {
    switch (appFlavor) {
      case Flavor.STAGING:
        return dotenv.env['CLIENT_ID_STAGING'].orEmpty;
      case Flavor.PRODUCTION:
        return dotenv.env['CLIENT_ID'].orEmpty;
      case Flavor.DEVELOPMENT:
      default:
        return dotenv.env['CLIENT_ID_DEV'].orEmpty;
    }
  }

  static String get clientSecret {
    switch (appFlavor) {
      case Flavor.STAGING:
        return dotenv.env['CLIENT_SECRET_STAGING'].orEmpty;
      case Flavor.PRODUCTION:
        return dotenv.env['CLIENT_SECRET'].orEmpty;
      case Flavor.DEVELOPMENT:
      default:
        return dotenv.env['CLIENT_SECRET_DEV'].orEmpty;
    }
  }
}
