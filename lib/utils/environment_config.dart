class EnvironmentConfig {
  static const URL = String.fromEnvironment(
    'URL',
    defaultValue: 'https://parallax-api-dev.herokuapp.com'
  );
}