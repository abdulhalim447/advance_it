class ApiConstants {
  static const String baseUrl = 'https://api.example.com';
  static const int connectTimeout = 15000;
  static const int receiveTimeout = 15000;

  // Endpoints
  static const String users = '/users';
  static const String login = '/auth/login';
  static const String register = '/auth/register';

  // Headers
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';
}
