import 'package:base_flutter_project/core/cubit/base_cubit_state.dart';
import 'package:base_flutter_project/core/extensions/string_ext.dart';
import 'package:base_flutter_project/domains/login/login_cubit.dart';
import 'package:base_flutter_project/repositories/login/login_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginUseCase {
  LoginUseCase();

  late LoginCubit cubit;

  void init() {
    cubit = LoginCubit(LoginRepository());
  }

  void invoke({String? username, String? password}) {
    cubit.invoke(username: username, password: password);
  }

  RepositoryProvider getRepoProvider() {
    return RepositoryProvider(create: (context) => LoginRepository());
  }

  BlocProvider getBlocProvider() {
    return BlocProvider<LoginCubit>(create: (_) => cubit);
  }

  BlocListener getBlocListener({
    Function? onLoading,
    Function(String)? onSuccess,
    Function(String)? onError,
  }) {
    return BlocListener<LoginCubit, BaseCubitState<LoginViewState>>(
      listener: (context, state) {
        if (state is SuccessState<LoginViewState, String?>) {
          onSuccess?.call(state.data.orEmpty);
        } else if (state is LoadingState<LoginViewState>) {
          onLoading?.call();
        } else if (state is ErrorState<LoginViewState>) {
          onError?.call(state.toString());
        }
      },
    );
  }
}
