import '../core/entities/auth_user.dart';
import '../core/auth_error.dart';

enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

class AuthState {
  final AuthStatus status;
  final AuthUser? user;
  final AuthError? error;
  const AuthState({this.status = AuthStatus.initial, this.user, this.error});
}
