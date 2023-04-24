class User {
  String? name;
  String email;
  String password;
  String deviceName;
  String? passwordConfirmation;

  User({
     this.name,
    required this.email,
    required this.password,
    required this.deviceName,
     this.passwordConfirmation,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      deviceName: json['device_name'],
      passwordConfirmation: json['password_confirmation'],
    );
  }

  Map<String, String?> toJson() {
    final Map<String, String?> data =  <String, String?>{};
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['device_name'] = deviceName;
    data['password_confirmation'] = passwordConfirmation;
    return data;
  }
}
