import 'dart:convert';

import 'package:base_flutter_project/core/app_config.dart';
import 'package:base_flutter_project/core/constants.dart';
import 'package:base_flutter_project/core/extensions/string_ext.dart';
import 'package:base_flutter_project/core/models/error_exception.dart';
import 'package:base_flutter_project/core/network/api_endpoints.dart';
import 'package:base_flutter_project/core/network/http_service.dart';
import 'package:base_flutter_project/domains/login/login_request.dart';
import 'package:base_flutter_project/domains/login/user_token.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class LoginRepository {
  HttpService httpService = HttpService();

  Future<LoginResponse> doLogin(String username, String password) async {
    String? fcmToken;
    if (!AppConfig.isWeb) {
      fcmToken = await FirebaseMessaging.instance.getToken();
    }
    LoginRequest requestBody = LoginRequest(
      grantType: LoginConstants.loginGrantType,
      clientId: dotenv.env["CLIENT_ID"].orEmpty,
      clientSecret: dotenv.env["CLIENT_SECRET"].orEmpty,
      username: username,
      password: password,
      scope: LoginConstants.loginScope,
      fcmToken: fcmToken ?? "",
      // need firebase first.
      deviceAppVersion: "todo!",
      deviceName: "todo!",
      deviceOSVersion: "todo!",
    );

    final result = await httpService.requestAPI(
      endpoint: ApiEndpoints.login,
      method: Method.POST,
      params: requestBody.toJson(),
    );

    return result.fold(
      (left) => LoginResponse.fromJson(
        jsonDecode(left.body),
      ),
      (exception) => throw ErrorException(
        code: exception.code,
        message: exception.message,
      ),
    );
  }
}
