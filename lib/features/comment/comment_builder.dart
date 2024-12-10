import 'package:eco_bite/core/comment_bottom_sheet.dart';
import 'package:eco_bite/features/comment/logic/cubit/comment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentsBuilder extends StatelessWidget {
  final String shopName;
  const CommentsBuilder({super.key, required this.shopName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          BlocBuilder<CommentCubit, CommentState>(
            builder: (context, state) {
              if (state is CommentSuccess) {
                return GestureDetector(
                  onTap: () => CommentsBottomSheet(
                    shopId: shopName,
                  ),
                  child: Text(
                    "Show Comments (${state.comment.length})",
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.blue,
                    ),
                  ),
                );
              } else if (state is CommentLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is CommentError) {
                return Text(
                  state.error,
                  style: const TextStyle(color: Colors.black),
                );
              }
              return Container();
            },
          );
        },
        child: Text("voir les commentaires"));
  }
}
