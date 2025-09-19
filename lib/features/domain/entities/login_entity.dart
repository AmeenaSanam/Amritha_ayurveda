class LoginEntity {
  final bool status;
  final String message;
  final String? token;

  LoginEntity({
    required this.status,
    required this.message,
    this.token,
  });
}
