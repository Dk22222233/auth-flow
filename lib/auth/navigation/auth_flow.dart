import 'package:easy_auth_module/auth/ui/login/login_screen.dart';
import 'package:easy_auth_module/auth/ui/signup/signup_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum _AuthRoutes { login, signup, forgotPassword }

class AuthFlow extends ConsumerStatefulWidget {
  const AuthFlow({super.key});
  @override
  ConsumerState<AuthFlow> createState() => _AuthFlowState();
}

class _AuthFlowState extends ConsumerState<AuthFlow> {
  _AuthRoutes _route = _AuthRoutes.login;
  @override
  Widget build(BuildContext context) {
    return switch (_route) {
      _AuthRoutes.login => LoginScreen(
        onSignupTap: () => setState(() => _route = _AuthRoutes.signup),
      ),
      _AuthRoutes.signup => SignupScreen(
        onLogin: () => setState(() => _route = _AuthRoutes.login),
      ),
    };
  }
}
