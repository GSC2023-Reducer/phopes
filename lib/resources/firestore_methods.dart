import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phopes/resources/storage_methods.dart';

import '../models/post_model.dart';

class FirestoreMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //upload post
  Future<String> uploadPost(
    String description,
    Uint8List file,
    String email,
    String region,
  ) async {
    String photoUrl =
        await StorageMethods().uploadImageToStorage('certificate', file);

    Post post = Post(
      description: description,
      postUrl: photoUrl,
    );

    _firestore
        .collection('users')
        .doc(email)
        .collection('travels')
        .doc('travel - $region')
        .collection('certificate')
        .doc('image')
        .set(
          post.toJson(),
        );

    return 'success';
  }
}
