import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:eco_bite/features/comment/data/comment.dart';
import 'package:eco_bite/features/comment/repo/comment_repo.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_state.dart';
part 'comment_cubit.freezed.dart';

class CommentCubit extends Cubit<CommentState> {
  final CommentsRepo _commentsRepo;
  final TextEditingController commentController = TextEditingController();

  CommentCubit(this._commentsRepo) : super(CommentState.initial());

  StreamSubscription<List<Comment>>? _commentsSubscription;

  void fetchComments() {
    emit(const CommentState.loading());
    _commentsSubscription?.cancel(); // Cancel previous subscription
    _commentsSubscription = _commentsRepo.getComments().listen(
      (comments) {
        if (comments.isEmpty) {
          emit(const CommentState.error('No comments available.'));
        } else {
          emit(CommentState.success(comments));
        }
      },
      onError: (error) {
        emit(CommentState.error('Failed to fetch comments: $error'));
      },
    );
  }

  Future<void> addComment(String shopId) async {
    if (commentController.text.isNotEmpty) {
      emit(const CommentState.loading());
      try {
        final comment = Comment(
          content: commentController.text,
          timestamp: DateTime.now(),
          shopId: shopId,
          userId: 'userId',
        );
        await _commentsRepo.addComment(comment);
        commentController.clear();

        // Fetch updated comments
        await Future.delayed(
            const Duration(milliseconds: 500)); // Allow backend to update
        fetchComments();
      } catch (e) {
        emit(CommentState.error('Failed to add comment: $e'));
        print('Error adding comment: $e');
      }
    } else {
      emit(const CommentState.error('Comment cannot be empty.'));
    }
  }

  @override
  Future<void> close() {
    commentController.dispose();
    _commentsSubscription?.cancel();
    return super.close();
  }
}
