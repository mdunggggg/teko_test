import 'package:injectable/injectable.dart';

@injectable
class EnvironmentConfig {
  static const BASE_URL_HTTP =
  String.fromEnvironment('DART_DEFINES_BASE_URL_HTTP', defaultValue: 'https://hiring-test.stag.tekoapis.net');
}
