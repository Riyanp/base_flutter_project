class ErrorException implements Exception {
  int? code;
  String? message;

  ErrorException({
    this.code,
    this.message,
  });
}
