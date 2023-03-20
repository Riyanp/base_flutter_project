import 'package:base_flutter_project/core/constants.dart';
import 'package:base_flutter_project/core/cubit/base_cubit_state.dart';
import 'package:base_flutter_project/core/extensions/string_ext.dart';
import 'package:base_flutter_project/core/models/error_exception.dart';
import 'package:base_flutter_project/core/utils/logger.dart';
import 'package:base_flutter_project/domains/login/user_token.dart';
import 'package:base_flutter_project/repositories/login/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit<BaseCubitState<LoginViewState>> {
  LoginCubit(this.loginRepository) : super(InitialState<LoginViewState>());

  final LoginRepository loginRepository;
  late SharedPreferences sharedPref;

  void invoke({String? username, String? password}) async {
    sharedPref = await SharedPreferences.getInstance();
    emit(LoadingState<LoginViewState>());
    try {
      LoginResponse result = await loginRepository.doLogin(
        username.orEmpty,
        password.orEmpty,
      );
      await saveUserData(result, username.orEmpty, password.orEmpty);
      emit(SuccessState<LoginViewState, String>(result.token));
    } on ErrorException catch (error) {
      logger.e("ERROR LoginViewState ${error.message}");
      emit(ErrorState<LoginViewState>(error));
    }
  }

  Future<void> saveUserData(
    LoginResponse result,
    String username,
    String password,
  ) async {
    sharedPref.setString(Constants.accessToken, result.token);
    sharedPref.setInt(Constants.userId, result.id);
    sharedPref.setString(Constants.userEmail, result.email);
    sharedPref.setString(Constants.userLoginName, username);
    sharedPref.setString(Constants.userLoginPassword, password);
  }
}

class LoginViewState {}
