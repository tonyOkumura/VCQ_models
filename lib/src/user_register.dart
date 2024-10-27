import 'package:equatable/equatable.dart';

class UserRegister extends Equatable {
  final String id;
  final String username;
  final String password_hash;
  final String secret_word;

  UserRegister({
    required this.id,
    required this.username,
    required this.password_hash,
    required this.secret_word,
  });
  factory UserRegister.fromJson(Map<String, dynamic> json) {
    return UserRegister(
      id: json['id'],
      username: json['username'],
      password_hash: json['password_hash'],
      secret_word: json['secret_word'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'password_hash': password_hash,
        'secret_word': secret_word
      };

  @override
  List<Object?> get props => [id, username, password_hash, secret_word];
}
