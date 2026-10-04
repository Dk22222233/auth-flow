import 'package:easy_auth_module/auth/core/auth_error.dart';
import 'package:easy_auth_module/auth/core/entities/auth_user.dart';

class AuthResult {
  final AuthUser? user;
  final AuthError? error;
  const AuthResult({this.error, this.user});
  factory AuthResult.success(AuthUser user) {
    return AuthResult(user: user);
  }
  factory AuthResult.failure(AuthError error) {
    return AuthResult(error: error);
  }
  bool get inSuccess => error == null;
}
