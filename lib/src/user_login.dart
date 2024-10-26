import 'package:equatable/equatable.dart';

class UserLogin extends Equatable {
  final String username;
  final String password;

  UserLogin({
    required this.username,
    required this.password,
  });
  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      username: json['email'],
      password: json['password'],
    );
  }

  Map<String, dynamic> toJson() => {
        'email': username,
        'password': password,
      };

  @override
  List<Object?> get props => [
        username,
        password,
      ];
}
