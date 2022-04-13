import 'package:firebase_core/firebase_core.dart';

const firebaseOptions = FirebaseOptions(
  apiKey: '',
  appId: '',
  messagingSenderId: '',
  projectId: '',
);

final isFirebaseConfigured = firebaseOptions.apiKey.isNotEmpty &&
    firebaseOptions.appId.isNotEmpty &&
    firebaseOptions.messagingSenderId.isNotEmpty &&
    firebaseOptions.projectId.isNotEmpty;
