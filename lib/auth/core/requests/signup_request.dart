class SignupRequest {
  final String email;
  final String password;

  final String? name;

  SignupRequest({required this.email, required this.password, this.name});
}
