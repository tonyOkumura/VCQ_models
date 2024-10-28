import 'package:equatable/equatable.dart';

import 'package:uuid/uuid.dart';

import '../models.dart';

class ChatRoom extends Equatable {
  final String id;
  final List<User> participants;
  final Message? lastMessage;
  final int? unreadCount;

  const ChatRoom({
    required this.id,
    required this.participants,
    this.lastMessage,
    this.unreadCount,
  });

  ChatRoom copyWith({
    String? id,
    List<User>? participants,
    Message? lastMessage,
    int? unreadCount,
  }) {
    return ChatRoom(
      id: id ?? this.id,
      participants: participants ?? this.participants,
      lastMessage: lastMessage ?? this.lastMessage,
      unreadCount: unreadCount ?? this.unreadCount,
    );
  }

  factory ChatRoom.fromJson(Map<String, dynamic> json) {
    return ChatRoom(
      id: json['id'],
      participants: (json['participants'] as List)
          .map<User>((user) => User.fromJson(user as Map<String, dynamic>))
          .toList(),
      lastMessage: json['last_message'] != null
          ? Message.fromJson(json['last_message'])
          : null,
      unreadCount: json['unread_count'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'participants': participants.map((user) => user.toJson()).toList(),
      'last_message': lastMessage?.toJson(),
      'unread_count': unreadCount,
    };
  }

  @override
  List<Object?> get props => [id, participants, lastMessage, unreadCount];
}
