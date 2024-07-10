import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fireflutter/fireflutter.dart';

class FriendService {
  static FriendService? _instance;
  static FriendService get instance => _instance ??= FriendService();

  final CollectionReference col =
      FirebaseFirestore.instance.collection('friends');

  Future<List<Friend>> getFriends() async {
    // Get friends from API
    return [];
  }

  // Future<Friend> getFriendById(int id) async {
  //   // Get friend by id from API
  //   return ;
  // }

  // Future<Friend> addFriend(Friend friend) async {
  //   // Add friend to API
  //   return null;
  // }

  // Future<Friend> updateFriend(Friend friend) async {
  //   // Update friend to API
  //   return null;
  // }

  // Future<void> deleteFriend(int id) async {
  //   // Delete friend from API
  // }
}
