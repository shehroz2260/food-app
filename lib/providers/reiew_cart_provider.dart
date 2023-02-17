import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ReviewCartProvider with ChangeNotifier {
  addReviewCartdata(
      {required String cartName,
      required String cartImage,
      required String cartQuantity,
      required String cartId,
      required int cartPrice}) async {
    FirebaseFirestore.instance
        .collection('ReviewcartData')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('ReviewcartData')
        .doc(cartId)
        .set({
          'cartId' : cartId,
          'cartName' :cartName,
          'cartImage' : cartImage,
          'cartPrice' :cartPrice,
          'cartQuantity' : cartQuantity,
 
        });
  }
}
