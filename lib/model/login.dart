class Login {
  String? username;
  String? password;

  Login({
    required this.username,
    required this.password,
  });
  factory Login.fromJson(Map<String, String> json) {
    return Login(username: json['username'], password: json['password']);
  }

  Map<String, String> toJson() {
    return {
      'username': username ?? '',
      'password': password ?? '',
    };
  }
}
