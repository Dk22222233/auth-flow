import 'auth_result.dart';
import 'requests/signup_request.dart';
import 'requests/login_request.dart';
import 'entities/auth_user.dart';

abstract class AuthService {
  Future<AuthResult> signup(SignupRequest request);
  Future<AuthResult> login(LoginRequest request);
  AuthUser? get currentUser;
  Stream<AuthUser?> get authStateChanges;
}
