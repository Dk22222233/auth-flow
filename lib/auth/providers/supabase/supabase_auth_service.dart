import 'package:easy_auth_module/auth/core/auth_result.dart';
import 'package:easy_auth_module/auth/core/auth_service.dart';
import 'package:easy_auth_module/auth/core/requests/login_request.dart';
import 'package:easy_auth_module/auth/core/requests/signup_request.dart';
import 'package:easy_auth_module/auth/providers/supabase/supabase_client.dart';

class SupabaseAuthService implements AuthService {
  @override
  Future<AuthResult> login(SignupRequest request) async{
   final response= await SupabaseClientProvider.client.auth.signInWithPassword(
      email: request.email,
      password: request.password,
    );
   final supabaseUser=response.user;
    return 
  }

  @override
  Future<AuthResult> signup(LoginRequest request) {}
}
