import 'package:equatable/equatable.dart';

class UserRegister extends Equatable {
  final String username;
  final String password;
  final String secret_word;

  UserRegister({
    required this.username,
    required this.password,
    required this.secret_word,
  });
  factory UserRegister.fromJson(Map<String, dynamic> json) {
    return UserRegister(
      username: json['email'],
      password: json['password'],
      secret_word: json['secret_word'],
    );
  }

  Map<String, dynamic> toJson() =>
      {'email': username, 'password': password, 'secret_word': secret_word};

  @override
  List<Object?> get props => [username, password, secret_word];
}
