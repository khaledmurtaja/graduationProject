class ApiEndPoints {
  static const String BASE_URL = 'http://192.168.1.109:8000';

  static const String IMAGE_BASE_URL = 'http://192.168.1.109:8000/storage/';

  /// change this according to Server ip address
  static const String REGISTER = '/api/user/create';
  static const String LOGIN = '/api/user/login';
  static const String LOGUT = "/api/user/logout";
  static const String SHARE_OFFER = "/api/donations";
  static const String SHARE_APPEAL = "/api/appeals";
  static const String PUBLIC_APPEALS = "/api/public-appeals";
  static const String ARTICLS = "/api/articles";

  static const String CAMPAINGNS = "/api/donation-campaigns";
}
