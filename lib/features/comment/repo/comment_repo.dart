import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eco_bite/features/comment/data/comment.dart';

class CommentsRepo {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  late final CollectionReference<Comment> _commentRef;

  CommentsRepo() {
    // withConverter method is used to convert Firestore documents to and from a Comment model class
    _commentRef = _firestore.collection('comments').withConverter<Comment>(
          // Converts Firestore data to a Comment object.
          fromFirestore: (snapshot, _) {
            final data = snapshot.data();
            if (data == null) {
              throw Exception('No data found in snapshot');
            }
            return Comment.fromJson(data);
          },
          // Converts a Comment object to JSON format for storing in Firestore.
          toFirestore: (comment, _) => comment.toJson(),
        );
  }

  Stream<List<Comment>> getComments() {
    return _commentRef.snapshots().map((snapshot) {
      final comments = snapshot.docs.map((doc) => doc.data()).toList();
      print('Fetched comments: $comments'); // Add this line
      return comments;
    });
  }

  Future<void> addComment(Comment comment) async {
    try {
      await _commentRef.add(comment);
      print('comment added succesfully');
    } catch (e) {
      print('Error adding comment: $e');
    }
  }

  void updateComment(String commentId, Comment comment) {
    _commentRef.doc(commentId).update(comment.toJson());
  }

  void deleteComment(String commentId) {
    _commentRef.doc(commentId).delete();
  }
}
