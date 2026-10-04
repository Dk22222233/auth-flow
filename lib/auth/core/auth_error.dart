enum AuthErrorType {
  invalidCredentials,
  network,
  emailAlreadyExist,
  userNotFound,
  sessionExpired,
  unknown,
}

class AuthError {
  final AuthErrorType type;
  final String message;
  const AuthError({required this.type, required this.message});

  factory AuthError.invalidCredentials() {
    return const AuthError(
      type: AuthErrorType.invalidCredentials,
      message: 'Invalid email or password',
    );
  }
  factory AuthError.network() {
    return const AuthError(
      type: AuthErrorType.network,
      message: 'No Active Internet. Try refresh your internet',
    );
  }
  factory AuthError.emailAlreadyExist() {
    return const AuthError(
      type: AuthErrorType.emailAlreadyExist,
      message: 'This email is already used. Try different email',
    );
  }
  factory AuthError.userNotFound() {
    return const AuthError(
      type: AuthErrorType.userNotFound,
      message: 'User not found',
    );
  }
  factory AuthError.sessionExpired() {
    return const AuthError(
      type: AuthErrorType.sessionExpired,
      message: 'Session Expired',
    );
  }
  factory AuthError.unknown() {
    return const AuthError(
      type: AuthErrorType.unknown,
      message: 'Unkown Error. Report bug',
    );
  }
}
