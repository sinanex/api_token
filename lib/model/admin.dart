class Adminmodel {
  String? username;
  String? password;

  Adminmodel({
    required this.password,
    required this.username,
  });
  Map<String, dynamic> toJosn() {
    return {
      'adminName': username,
      'password': password,
    };
  }
}
