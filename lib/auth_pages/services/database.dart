import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/rendering.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUser(String userId, Map<String, dynamic> UserInfoMap) {
    return FirebaseFirestore.instance
        .collection("User")
        .doc(userId)
        .set(UserInfoMap);
  }
}
