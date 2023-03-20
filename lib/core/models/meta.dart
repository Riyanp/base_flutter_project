import 'package:base_flutter_project/core/models/page.dart';

class Meta {
  int? code;
  String? message;
  List<String>? errors;
  Page? page;

  Meta({this.code, this.message, this.errors, this.page});

  Meta.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['errors'] != null) {
      errors = json['errors'].cast<String>();
    }
    page = json['page'] != null ? Page.fromJson(json['page']) : null;
  }
}