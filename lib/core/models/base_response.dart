import 'package:base_flutter_project/core/models/meta.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  Meta? meta;
  T? data;

  BaseResponse({this.meta, required this.data});

  BaseResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) createData,
  ) {
    _setBaseResponseData(json);
    data = json['data'] != null ? createData(json['data']) : null;
  }

  void _setBaseResponseData(Map<String, dynamic> json) {
    meta = _getMeta(json);
  }

  Meta? _getMeta(Map<String, dynamic> json) {
    return json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
}
