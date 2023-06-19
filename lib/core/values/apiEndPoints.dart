class ApiEndPoints{
  static const String BASE_URL = 'http://192.168.1.7:8000';/// change this according to Server ip address
  static const String REGISTER='/api/user/create';
  static const String LOGIN='/api/user/login';
  static const String LOGUT="/api/user/logout";
  static const String SHARE_OFFER="/api/donations";
  static const String SHARE_APPEAL="/api/appeals";
  static const String PUBLIC_APPEALS="/api/public-appeals";
  static const String PUBLIC_OFFERS="/api/public-donation";
  static const String ARTICLS = "/api/articles";
  static const String CAMPAINGNS = "/api/donation-campaigns";
  static const String IMAGE_BASE_URL = "${BASE_URL}/storage/";
  static const String SEND_EMAIL_VERIFICATION="/api/user/sendVerificationEmailCode";
  static const String CHECK_OTP_CODE="/api/user/verification/code";
  static const String sendForgetPasswordCode="/api/user/sendForgetPasswordCode";
  static const String ForgottenPasswordCodeVerification="/api/user/CheckForgetPasswordCode";
  static const String RESET_FORGOTTEN_PASSWORD="/api/user/ResetForgetedPassword";
  static const String CHANGE_CURRENT_PASSWORD="/api/user/resetCurrentPassword";
}