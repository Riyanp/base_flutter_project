import 'package:base_flutter_project/core/models/meta.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(genericArgumentFactories: true)
class BaseListResponse<T> {
  Meta? meta;
  List<T>? data;

  BaseListResponse({this.meta, required this.data});

  BaseListResponse.fromJson(
    Map<String, dynamic> json,
    Function(Map<String, dynamic>) createData,
  ) {
    _setBaseResponseData(json);
    if (json['data'] != null) {
      var dataList = <T>[];
      json['data'].forEach((v) {
        dataList.add(createData(v));
      });
      data = dataList;
    } else {
      data = [];
    }
  }

  void _setBaseResponseData(Map<String, dynamic> json) {
    meta = _getMeta(json);
  }

  Meta? _getMeta(Map<String, dynamic> json) {
    return json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }
}
