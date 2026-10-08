import 'package:easy_auth_module/auth/core/auth_service.dart';
import 'package:easy_auth_module/auth/core/requests/login_request.dart';
import 'package:easy_auth_module/auth/core/requests/signup_request.dart';
import 'package:easy_auth_module/auth/state/auth_provider.dart';
import 'package:easy_auth_module/auth/state/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthController extends Notifier<AuthState> {
  late final AuthService _authService;
  @override
  AuthState build() {
    _authService = ref.read(authServiceProvider);
    return const AuthState(status: AuthStatus.initial);
  }

  Future<void> login(LoginRequest request) async {
    state = AuthState(status: AuthStatus.loading);

    final result = await _authService.login(request);
    if (result.isSuccess) {
      state = AuthState(status: AuthStatus.authenticated, user: result.user);
    } else {
      state = AuthState(status: AuthStatus.error, error: result.error);
    }
  }

  Future<void> signup(SignupRequest request) async {
    state = AuthState(status: AuthStatus.loading);
    final result = await _authService.signup(request);
    if (result.isSuccess) {
      state = AuthState(status: AuthStatus.authenticated, user: result.user);
    } else {
      state = AuthState(status: AuthStatus.error, error: result.error);
    }
  }
}
