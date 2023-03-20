
import 'package:base_flutter_project/core/models/error_exception.dart';

abstract class BaseCubitState<ViewState> {}

class InitialState<ViewState> extends BaseCubitState<ViewState> {}

class LoadingState<ViewState> extends BaseCubitState<ViewState> {}

class LoadMoreState<ViewState, DataType> extends BaseCubitState<ViewState> {
  LoadMoreState(this.data);

  final DataType data;
}

class EmptyState<ViewState> extends BaseCubitState<ViewState> {}

class SuccessState<ViewState, DataType> extends BaseCubitState<ViewState> {
  SuccessState(this.data);

  final DataType? data;
}

class ErrorState<ViewState> extends BaseCubitState<ViewState> {
  ErrorState(this.errorResponse);

  final ErrorException errorResponse;

  @override
  String toString() {
    return errorResponse.message?.replaceAll("Exception:", "") ??
        "Terjadi kesalahan pada server";
  }
}
