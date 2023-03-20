import 'dart:developer';

import 'package:base_flutter_project/components/app_bar_gone.dart';
import 'package:base_flutter_project/components/primary_button.dart';
import 'package:base_flutter_project/components/sheet_widget.dart';
import 'package:base_flutter_project/components/text_field_outline_widget.dart';
import 'package:base_flutter_project/components/text_widget.dart';
import 'package:base_flutter_project/core/constants.dart';
import 'package:base_flutter_project/core/theme.dart';
import 'package:base_flutter_project/core/utils/snackbar_utils.dart';
import 'package:base_flutter_project/domains/login/login_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:notification_permissions/notification_permissions.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/login";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}

class _LoginScreenState extends State<LoginScreen> {
  final _useCase = LoginUseCase();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool? _canCheckBiometrics;
  List<BiometricType>? _availableBiometrics;
  String _savedUsername = "";
  String _savedPassword = "";
  bool _isLoading = false;

  String? _username, _password;
  String _appVersion = "0.0";

  @override
  void initState() {
    super.initState();
    _useCase.init();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() => _appVersion = packageInfo.version);
    });
    initBiometricsAvailability();
    checkNotificationPermission(context);
  }

  /// Used to check Biometric Availability
  /// remove if not needed
  void initBiometricsAvailability() {
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() => _supportState = isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
    _checkBiometrics();
    _getAvailableBiometrics();
  }

  void checkNotificationPermission(BuildContext context) async {
    NotificationPermissions.getNotificationPermissionStatus().then((status) {
      if (status != PermissionStatus.granted) {
        _openNotificationPermissionDialog(context);
      }
    });
  }

  void _openNotificationPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
        title: const TextWidget(
          "Izinkan Notifikasi",
          textAlign: TextAlign.center,
          typographyToken: TypographyToken.text16SemiBold,
        ),
        content: SizedBox(
          height: 150,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const TextWidget(
                "Aplikasi membutuhkan izin untuk menampilkan notifikasi, silahkan izinkan notifikasi terlebih dahulu.",
                textAlign: TextAlign.center,
                maxLines: 4,
              ),
              const SizedBox(height: 32),
              PrimaryButton(
                text: "Izinkan",
                onClick: () {
                  Navigator.of(context).pop();
                  NotificationPermissions.requestNotificationPermissions(
                    iosSettings: const NotificationSettingsIos(
                      sound: true,
                      badge: true,
                      alert: true,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _checkBiometrics() async {
    late bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      log("Biometric Error : $e");
    }
    if (!mounted) {
      return;
    }

    setState(() => _canCheckBiometrics = canCheckBiometrics);
  }

  void _getAvailableBiometrics() async {
    late List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      log("Biometric Error : $e");
    }
    if (!mounted) {
      return;
    }

    setState(() => _availableBiometrics = availableBiometrics);
    _checkUserData();
  }

  void _checkUserData() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    _savedUsername = sharedPref.getString(Constants.userLoginName) ?? "";
    _savedPassword = sharedPref.getString(Constants.userLoginPassword) ?? "";

    if (_savedUsername.isNotEmpty &&
        _savedPassword.isNotEmpty &&
        _availableBiometrics?.isNotEmpty == true) {
      _authenticateWithBiometrics();
    }
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {});
      authenticated = await auth.authenticate(
        localizedReason: "Verifikasi fingerprint anda untuk login",
        authMessages: const <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Login',
            biometricHint: "",
            cancelButton: 'Batalkan',
          ),
        ],
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
    } on PlatformException catch (e) {
      log("Biometric Error : $e");
      setState(() {});
      return;
    }
    if (!mounted) {
      return;
    }
    if (authenticated) {
      _useCase.invoke(username: _savedUsername, password: _savedPassword);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const AppBarGone(showWhiteStatusBar: true),
      body: MultiRepositoryProvider(
        providers: [
          _useCase.getRepoProvider(),
        ],
        child: MultiBlocProvider(
          providers: [
            _useCase.getBlocProvider(),
          ],
          child: MultiBlocListener(
            listeners: [
              _useCase.getBlocListener(
                onLoading: () {
                  setState(() => _isLoading = true);
                },
                onSuccess: (data) => setState(() {
                  setState(() => _isLoading = false);
                }),
                onError: (error) {
                  setState(() => _isLoading = false);
                  SnackBarUtils(
                      context: context,
                      message: error,
                      type: SnackbarType.ERROR)
                      .show();
                }
              ),
            ],
            child: _loginFormWidget(context),
          ),
        ),
      ),
    );
  }

  Widget _loginFormWidget(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: SizedBox(
        height: MediaQuery.of(context).size.height - 24,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            Center(
                child: SizedBox(
                    height: 100,
                    child: Image.asset("assets/images/app-icon.png"))),
            const SizedBox(height: 20),
            const Center(
              child: TextWidget(
                "Flutter Mobile App",
                typographyToken: TypographyToken.text14SemiBold,
              ),
            ),
            const SizedBox(height: 40),
            const TextWidget(
              "Login",
              typographyToken: TypographyToken.title20,
              padding: EdgeInsets.only(left: 16),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 8.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      autovalidateMode: AutovalidateMode.always,
                      key: _formKey,
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          TextFieldOutlineWidget(
                            onChange: (val) {
                              _username = val.toString();
                            },
                            parametersValidate: _username,
                            labelText: 'Email',
                            obscureText: false,
                            actionKeyboard: TextInputAction.next,
                          ),
                          const SizedBox(height: 24),
                          TextFieldOutlineWidget(
                            onChange: (val) {
                              _password = val.toString();
                            },
                            parametersValidate: _password,
                            labelText: 'Password',
                            obscureText: true,
                            actionKeyboard: TextInputAction.done,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 24),
                      child: _isLoading
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Theme.of(context).primaryColor))
                          : PrimaryButton(
                              text: "Login",
                              onClick: () {
                                _onLoginButtonClicked(context);
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: TextWidget(
                "v-$_appVersion",
                textAlign: TextAlign.center,
                typographyToken: TypographyToken.text12,
                padding: const EdgeInsets.only(top: 24),
              ),
            ),
            const Spacer(),
            if (_savedUsername.isNotEmpty &&
                _savedPassword.isNotEmpty &&
                _availableBiometrics?.isNotEmpty == true)
              InkWell(
                onTap: () {
                  _authenticateWithBiometrics();
                },
                child: const Icon(
                  Icons.fingerprint_outlined,
                  size: 49,
                  color: AppThemes.primarySwatch,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _onLoginButtonClicked(BuildContext context) async {
    final FormState form = _formKey.currentState!;
    if (!form.validate()) {
      SnackBarUtils(
              context: context,
              message: "Harap lengkapi semua data di atas",
              type: SnackbarType.ERROR)
          .show();
    } else {
      form.save();
      if (_username?.isNotEmpty == true && _password?.isNotEmpty == true) {
        FocusManager.instance.primaryFocus?.unfocus();
        _useCase.invoke(username: _username!, password: _password!);
      } else {
        SnackBarUtils(
                context: context,
                message: "Harap lengkapi semua data di atas",
                type: SnackbarType.ERROR)
            .show();
      }
    }
  }

  // unused, saved for future reference.
  Future<void> showErrorSheet(BuildContext context) async {
    await showModalBottomSheet<int>(
        context: context,
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        builder: (context) => SheetWidget(
              title: "Login gagal",
              description:
                  "Silahkan periksa kembali username dan password anda",
              buttonText: "Tutup",
              buttonAction: () => Navigator.pop(context),
            ));
  }
}
