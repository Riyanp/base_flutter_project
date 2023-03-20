import 'package:flutter/material.dart';

String? commonValidation(String value, String messageError) {
  var required = requiredValidator(value, messageError);
  if (required != null) {
    return required;
  }
  return null;
}

String? requiredValidator(value, messageError) {
  if (value.isEmpty) {
    return messageError;
  }
  return null;
}

bool isValidPhoneNumber(String value) {
  if (value == null || value.isEmpty) {
    return false;
  }

  const pattern = r'(?:[0]9)?[0-9]{9,14}$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return false;
  }

  return true;
}

bool isValidIdNumber(String value) {
  if (value == null || value.isEmpty) return false;

  const pattern = r'^[0-9]{6}((0[1-9]|[12][0-9]|3[01])|(4[1-9]|5[0-9]|6[0-9]|7[1|0]))(0[1-9]|1[012])([0-9]{2})([0-9]{4})*$';
  final regExp = RegExp(pattern);

  if (!regExp.hasMatch(value)) {
    return false;
  }

  return true;
}

void changeFocus(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}