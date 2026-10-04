import 'package:easy_auth_module/auth/core/requests/login_request.dart';
import 'package:easy_auth_module/auth/state/auth_controller_provider.dart';
import 'package:easy_auth_module/auth/validation/validators.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:easy_auth_module/auth/ui/widgets/auth_text_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void login() {
    if (_formKey.currentState!.validate()) {
      // Perform login logic here
      String email = emailController.text;
      String password = passwordController.text;
      // You can use the email and password to make a login request
      LoginRequest loginRequest = LoginRequest(
        email: email,
        password: password,
      );
      ref.read(authControllerProvider.notifier).login(loginRequest);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthTextField(
                label: 'Email',
                hintText: 'Enter your email',
                obscureText: false,
                controller: emailController,
                validator: AuthValidators.validateEmail,
              ),
              const SizedBox(height: 16),
              AuthTextField(
                label: 'Password',
                hintText: 'Enter your password',
                obscureText: true,
                controller: passwordController,
                validator: AuthValidators.validatePassword,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
