import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String postUrl;
  const Post({
    required this.description,
    required this.postUrl,
  });

  Map<String, dynamic> toJson() => {
        "description": description,
        "postUrl": postUrl,
      };

  // document snapshot to user model
  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return Post(
      description: snapshot['description'],
      postUrl: snapshot['postUrl'],
    );
  }
}
