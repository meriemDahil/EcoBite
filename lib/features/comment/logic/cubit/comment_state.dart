part of 'comment_cubit.dart';


@freezed
class CommentState with _$CommentState {
  const factory CommentState.initial() = _Initial;
  const factory CommentState.loading() = CommentLoading;
  const factory CommentState.success(List<Comment> comment) = CommentSuccess;
  const factory CommentState.error(error) = CommentError;
}
