import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentService {
  const EnvironmentService._();

  static Future<void> loadEnvironment() async => await dotenv.load();
  static String _getEnv(String name) => dotenv.env[name] ?? '';

  static String get bundleId => _getEnv('BUNDLE_ID');
  static String get baseUrl => _getEnv('BASE_URL');
  static String get apiKey => _getEnv('API_KEY');

  static String get sentryDsn => _getEnv('SENTRY_DSN');

  static String get webAppDomain => _getEnv('WEB_APP_DOMAIN');
}
