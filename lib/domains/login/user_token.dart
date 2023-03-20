class LoginResponse {
  final String token;
  final int id;
  final String email;

  const LoginResponse({
    required this.token,
    required this.id,
    required this.email,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    var data = json['data'];
    return LoginResponse(
      token: data['access_token'] as String,
      id: 0, //TODO: FIX THIS : data['id'] as int,
      email: data['username'] as String,
    );
  }
}
