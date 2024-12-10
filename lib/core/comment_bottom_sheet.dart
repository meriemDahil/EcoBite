import 'package:eco_bite/features/comment/logic/cubit/comment_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsBottomSheet extends StatelessWidget {
  final String shopId;
  final Color backgroundColor;
  final double borderRadius;
  final TextStyle titleStyle;
  final double maxHeight;
  final InputDecoration? inputDecoration;

  CommentsBottomSheet({
    super.key,
    required this.shopId,
    this.backgroundColor = Colors.white,
    this.borderRadius = 25.0,
    this.titleStyle =
        const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    this.maxHeight = 300.0,
    this.inputDecoration,
  });

  static void show(BuildContext context, String shopId) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CommentsBottomSheet(shopId: shopId),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.2,
        maxChildSize: 0.95,
        expand: false,
        builder: (_, controller) {
          return BlocBuilder<CommentCubit, CommentState>(
            builder: (context, state) {
              if (state is CommentLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CommentSuccess) {
                return _buildSuccessContent(context, state, controller);
              }
               else {
                return const Center(child: Text('Failed to load comments'));
              }
            },
          );
        },
      ),
    );
  }

  Widget _buildSuccessContent(
      BuildContext context, CommentSuccess state, ScrollController controller) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            state.comment.isEmpty
                ? 'No comments found (${state.comment.length})'
                : 'Comments (${state.comment.length})',
            style: titleStyle,
          ),
        ),
        Expanded(
          child: ListView.builder(
            controller: controller,
            itemCount: state.comment.length,
            itemBuilder: (context, index) {
              final comment = state.comment[index];
              return ListTile(
                title: Text(comment.content),
                subtitle: Text('${comment.timestamp}'),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildCommentInput(context),
        ),
      ],
    );
  }

  Widget _buildCommentInput(BuildContext context) {
    return TextField(
      controller: context.read<CommentCubit>().commentController,
      decoration: inputDecoration ??
          InputDecoration(
            labelText: 'Add a comment',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
      onSubmitted: (value) {
        context.read<CommentCubit>().addComment(shopId);
      },
    );
  }
}
