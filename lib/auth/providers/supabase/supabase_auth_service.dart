import 'package:easy_auth_module/auth/core/auth_error.dart';
import 'package:easy_auth_module/auth/core/auth_result.dart';
import 'package:easy_auth_module/auth/core/auth_service.dart';
import 'package:easy_auth_module/auth/core/entities/auth_user.dart';
import 'package:easy_auth_module/auth/core/requests/login_request.dart';
import 'package:easy_auth_module/auth/core/requests/signup_request.dart';
import 'package:easy_auth_module/auth/providers/supabase/supabase_client.dart';

// import 'package:easy_auth_module/auth/core/auth_error.dart';

class SupabaseAuthService implements AuthService {
  @override
  Future<AuthResult> login(LoginRequest request) async {
    final response = await SupabaseClientProvider.client.auth
        .signInWithPassword(email: request.email, password: request.password);
    final supabaseUser = response.user;
    if (supabaseUser == null) {
      return AuthResult.failure(AuthError.unknown());
    }
    final user = AuthUser(id: supabaseUser.id, email: supabaseUser.email!);

    return AuthResult.success(user);
  }

  @override
  Future<AuthResult> signup(SignupRequest request) async {
    final response = await SupabaseClientProvider.client.auth.signUp(
      password: request.password,
      email: request.email,
      data: {'name': request.name},
    );
    final supabaseUser = response.user;
    if (supabaseUser == null) {
      return AuthResult.failure(AuthError.unknown());
    }
    final user = AuthUser(id: supabaseUser.id, email: supabaseUser.email!);
    return AuthResult.success(user);
  }
}
