library firebase_provider;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_provider/score_submit_model.dart';

class FirebaseProvider {
  FirebaseProvider({FirebaseFirestore? firestore}) : _firestore = firestore;

  final FirebaseFirestore? _firestore;

  void sendCustomerSatisfaction({required ScoreSubmitModel scoreSubmit}) {
    if (_firestore != null) {
      _firestore!.collection('customer_satisfaction').add(
            ScoreSubmitModel(
                    score: scoreSubmit.score,
                    chipIndexes: scoreSubmit.chipIndexes)
                .toJson(),
          );
    }
  }
}
