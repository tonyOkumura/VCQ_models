import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import '../models.dart';

class Message extends Equatable {
  final String chatRoomId;
  final String receiverUserId;
  final String senderUserId;
  final String? id;
  final String? content;
  final Attachment? attachment;
  final DateTime? createdAt;

  const Message({
    required this.chatRoomId,
    required this.senderUserId,
    required this.receiverUserId,
    this.createdAt,
    this.id,
    this.content,
    this.attachment,
  });

  Message copyWith({
    String? id,
    String? chatRoomId,
    String? senderUserId,
    String? receiverUserId,
    String? content,
    Attachment? attachment,
    DateTime? createdAt,
  }) {
    return Message(
      id: id ?? this.id,
      chatRoomId: chatRoomId ?? this.chatRoomId,
      senderUserId: senderUserId ?? this.senderUserId,
      receiverUserId: receiverUserId ?? this.receiverUserId,
      content: content ?? this.content,
      attachment: attachment ?? this.attachment,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'],
      chatRoomId: json['chat_room_id'],
      senderUserId: json['sender_user_id'],
      receiverUserId: json['receiver_user_id'],
      content: json['content'],
      attachment: json['attachment'] != null
          ? Attachment.fromJson(json['attachment'])
          : null,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id ?? Uuid().v4(),
      'chat_room_id': chatRoomId,
      'sender_user_id': senderUserId,
      'receiver_user_id': receiverUserId,
      'content': content,
      'attachment': attachment?.toJson(),
      'created_at': createdAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        chatRoomId,
        senderUserId,
        receiverUserId,
        content,
        attachment,
        createdAt,
      ];
}
