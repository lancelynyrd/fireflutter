import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireflutter/fireflutter.dart';

/// Firend Model
///
class Friend {
  static CollectionReference col = FriendService.instance.col;

  final String id;
  final String uid;

  Friend({
    required this.id,
    required this.uid,
  });

  factory Friend.fromSnapshot(DocumentSnapshot<Object?> snapshot) {
    if (snapshot.exists == false) {
      throw Exception('Friend.fromSnapshot: Document does not exist.');
    }

    final Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
    if (data == null) {
      throw Exception('Friend.fromSnapshot: Document is null.');
    }
    return Friend.fromJson(data, snapshot.id);
  }

  factory Friend.fromJson(Map<String, dynamic> json, String id) {
    return Friend(
      id: id,
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
    };
  }

  static Future<DocumentReference> create() {
    return FirebaseFirestore.instance.collection('friends').add({});
  }
}
