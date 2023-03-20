import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginRequest {
  @JsonKey(name: 'grant_type')
  final String grantType;
  @JsonKey(name: 'client_id')
  final String clientId;
  @JsonKey(name: 'client_secret')
  final String clientSecret;
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'password')
  final String password;
  @JsonKey(name: 'scope')
  final String scope;
  @JsonKey(name: 'fcm_token')
  final String fcmToken;
  @JsonKey(name: 'device_app_version')
  final String deviceAppVersion;
  @JsonKey(name: 'device_name')
  final String deviceName;
  @JsonKey(name: 'device_os_version')
  final String deviceOSVersion;

  const LoginRequest({
    required this.grantType,
    required this.clientId,
    required this.clientSecret,
    required this.username,
    required this.password,
    required this.scope,
    required this.fcmToken,
    required this.deviceAppVersion,
    required this.deviceName,
    required this.deviceOSVersion,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['grant_type'] = grantType;
    data['client_id'] = clientId;
    data['client_secret'] = clientSecret;
    data['username'] = username;
    data['password'] = password;
    data['scope'] = scope;
    data['fcm_token'] = fcmToken;
    data['device_app_version'] = deviceAppVersion;
    data['device_name'] = deviceName;
    data['device_os_version'] = deviceOSVersion;
    return data;
  }
}