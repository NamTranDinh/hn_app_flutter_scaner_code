enum Environment { DEV, STAGING, PROD }

class AppEnvironment {
  static var _config = _AppConfig(flavorName: 'DEV');

  static void _set({required Environment env}) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.devEnvironment;
        break;
      case Environment.STAGING:
        _config = _Config.stagingEnvironment;
        break;
      case Environment.PROD:
        _config = _Config.prodEnvironment;
        break;
      default:
        _config = _Config.devEnvironment;
        break;
    }
  }

  static void getAndSetEnv({required String flavorName}) {
    if (flavorName.toUpperCase() == Environment.DEV.name) {
      _set(env: Environment.DEV);
    } else if (flavorName.toUpperCase() == Environment.STAGING.name) {
      _set(env: Environment.STAGING);
    } else if (flavorName.toUpperCase() == Environment.PROD.name) {
      _set(env: Environment.PROD);
    }
  }

  static _AppConfig getConfig() => _config;
}

class _Config {
  static final devEnvironment = _AppConfig(
    apiBaseUrl: 'https://lotusops.merket.io/',
    header: _header,
    receiveTimeout: _receiveTimeout,
    connectionTimeout: _connectionTimeout,
    flavorName: Environment.DEV.name,
  );
  static final stagingEnvironment = _AppConfig(
    apiBaseUrl: 'https://lotusops.merket.io/',
    header: _header,
    receiveTimeout: _receiveTimeout,
    connectionTimeout: _connectionTimeout,
    flavorName: Environment.STAGING.name,
  );
  static final prodEnvironment = _AppConfig(
    apiBaseUrl: 'https://apismartinfo.mbbank.com.vn/',
    header: _header,
    receiveTimeout: _receiveTimeout,
    connectionTimeout: _connectionTimeout,
    flavorName: Environment.PROD.name,
  );

  static const _header = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };
  static const int _receiveTimeout = 15000;
  static const int _connectionTimeout = 15000;
}

class _AppConfig {
  _AppConfig({
    this.header,
    this.receiveTimeout,
    this.connectionTimeout,
    required this.flavorName,
    this.apiBaseUrl,
  });

  final String flavorName;
  final String? apiBaseUrl;
  final Map<String, String>? header;
  final int? receiveTimeout;
  final int? connectionTimeout;
}
