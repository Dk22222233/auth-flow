import 'package:easy_auth_module/auth/core/requests/signup_request.dart';
import 'package:easy_auth_module/auth/state/auth_controller_provider.dart';
import 'package:easy_auth_module/auth/validation/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:easy_auth_module/auth/ui/widgets/auth_text_field.dart';

class SignupScreen extends ConsumerStatefulWidget {
  final VoidCallback? onSignupTap;
  final VoidCallback? onForgotPasswordTap;
  final VoidCallback? onLogin;
  const SignupScreen({
    super.key,
    this.onForgotPasswordTap,
    this.onSignupTap,
    this.onLogin,
  });

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  void signup() {
    if (_formKey.currentState!.validate()) {
      String name = nameController.text;
      String email = emailController.text;
      String password = passwordController.text;
      SignupRequest signupRequest = SignupRequest(
        email: email,
        password: password,
        name: name,
      );
      ref.read(authControllerProvider.notifier).signup(signupRequest);

      //  using the name, email, password to make a signup request
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
                label: 'Name',
                hintText: 'Enter your name',
                obscureText: false,
                controller: nameController,
                validator: AuthValidators.validateName,
              ),
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
              const SizedBox(height: 16),
              AuthTextField(
                label: 'Confirm Password',
                hintText: 'Confirm your password',
                obscureText: true,
                controller: confirmPasswordController,
                validator: (value) {
                  return AuthValidators.validateConfirmPassword(
                    value,
                    passwordController.text,
                  );
                },
              ),
              TextButton(
                onPressed: widget.onSignupTap,
                child: const Text('Signup'),
              ),
              TextButton(onPressed: widget.onLogin, child: const Text('Login')),
              TextButton(
                onPressed: widget.onForgotPasswordTap,
                child: const Text('Forgot Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
