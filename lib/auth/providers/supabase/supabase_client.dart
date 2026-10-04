import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseClientProvider {
  static SupabaseClient get client => Supabase.instance.client;
  static Future<void> initialize({
    required String url,
    required String publishablekey,
  }) async {
    Supabase.initialize(url: url, publishableKey: publishablekey);
  }
}
