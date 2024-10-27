import 'package:equatable/equatable.dart';

class UserLogin extends Equatable {
  final String username;
  final String password_hash;

  UserLogin({
    required this.username,
    required this.password_hash,
  });
  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      username: json['username'],
      password_hash: json['password_hash'],
    );
  }

  Map<String, dynamic> toJson() => {
        'username': username,
        'password_hash': password_hash,
      };

  @override
  List<Object?> get props => [
        username,
        password_hash,
      ];
}
