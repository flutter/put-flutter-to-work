// ignore_for_file: subtype_of_sealed_class

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_provider/score_submit_model.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:firebase_provider/firebase_provider.dart';
import 'package:mocktail/mocktail.dart';

class FirebaseFirestoreMock extends Mock implements FirebaseFirestore {}

class MockCollectionReference extends Mock
    implements CollectionReference<Map<String, dynamic>> {}

class MockDocumentReference extends Mock
    implements DocumentReference<Map<String, dynamic>> {}

class MockDocumentSnapshot extends Mock
    implements DocumentSnapshot<Map<String, dynamic>> {}

void main() {
  late final FirebaseFirestore mockFirebase;
  late final FirebaseProvider firebaseProvider;
  late final CollectionReference<Map<String, dynamic>> collection;
  late final DocumentReference<Map<String, dynamic>> mockDocumentReference;
  final scoreSubmit = ScoreSubmitModel(score: 1, chipIndexes: [0, 1]);

  setUpAll(() {
    mockFirebase = FirebaseFirestoreMock();
    firebaseProvider = FirebaseProvider(firestore: mockFirebase);
    collection = MockCollectionReference();
    mockDocumentReference = MockDocumentReference();
  });
  test('sendCustomerSatisfaction sends data', () {
    when(() => mockFirebase.collection('customer_satisfaction'))
        .thenReturn(collection);
    when(() => collection.add(scoreSubmit.toJson()))
        .thenAnswer((_) => Future.value(mockDocumentReference));

    firebaseProvider.sendCustomerSatisfaction(scoreSubmit: scoreSubmit);

    verify(() => mockFirebase
        .collection('customer_satisfaction')
        .add(scoreSubmit.toJson())).called(1);
  });
}
