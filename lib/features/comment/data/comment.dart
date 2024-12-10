import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'comment.freezed.dart';
part 'comment.g.dart';

class TimestampConverter implements JsonConverter<DateTime, Timestamp> {
  const TimestampConverter();

  @override
  DateTime fromJson(Timestamp timestamp) {
    return timestamp.toDate();
  }

  @override
  Timestamp toJson(DateTime dateTime) {
    return Timestamp.fromDate(dateTime);
  }
}

@freezed
class Comment with _$Comment {
  factory Comment({
    required String shopId,
    required String userId,
    required String content,
    @TimestampConverter() required DateTime timestamp,
    int? likesCount, // The number of likes the comment has received (optional).
    List<String>? likedBy,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
