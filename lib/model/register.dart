class Register {
  String? name;
  String? username;
  String? email;
  String? password;
  String? token;

  Register({
    required this.name,
    required this.username,
    required this.email,
    required this.password,
    this.token,
  });
  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
      email: json['email'],
      username: json['username'],
      token: json['token'],
        name: json['name'],
        password: json['password'],

    );
  }
  Map<String, String> toJson() {
    return {
      'email': email ?? '',
      'name': name ?? '',
      'password': password ?? '',
      'username': username ?? '',
    };
  }
}
