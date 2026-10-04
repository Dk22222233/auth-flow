import 'package:easy_auth_module/auth/core/auth_service.dart';
import 'package:easy_auth_module/auth/providers/supabase/supabase_auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authServiceProvider = Provider<AuthService>(
  (ref) => SupabaseAuthService(),
);
