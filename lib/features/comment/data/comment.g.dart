// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CommentImpl _$$CommentImplFromJson(Map<String, dynamic> json) =>
    _$CommentImpl(
      shopId: json['shopId'] as String,
      userId: json['userId'] as String,
      content: json['content'] as String,
      timestamp:
          const TimestampConverter().fromJson(json['timestamp'] as Timestamp),
      likesCount: (json['likesCount'] as num?)?.toInt(),
      likedBy:
          (json['likedBy'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CommentImplToJson(_$CommentImpl instance) =>
    <String, dynamic>{
      'shopId': instance.shopId,
      'userId': instance.userId,
      'content': instance.content,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
      'likesCount': instance.likesCount,
      'likedBy': instance.likedBy,
    };
