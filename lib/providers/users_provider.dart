import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  void addUsersdata(
      {required User currentUser,
      required String userName,
      required String userEmail,
      required String userImage}) async {
    await FirebaseFirestore.instance
        .collection('usersData')
        .doc(currentUser.uid)
        .set(
      {
        'usersName': userName,
        'usersEmail': userEmail,
        'usersImage': userImage,
        'usersId': currentUser.uid,
      },
    );
    {}
  }
}
