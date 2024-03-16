class AuthResponseModel {
  int statusCode;
  String message;
  String accessToken;
  int loginTime;
  int expirationDuration;
  
  AuthResponseModel({
    required this.statusCode,
    required this.message,
    required this.accessToken,
    required this.loginTime,
    required this.expirationDuration
  });
  
}