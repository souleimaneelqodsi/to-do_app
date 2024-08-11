import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyBv7ABt13S6cj6z3WsTsJc0Zj5cQrPuInc",
            authDomain: "to-do-app-57m7av.firebaseapp.com",
            projectId: "to-do-app-57m7av",
            storageBucket: "to-do-app-57m7av.appspot.com",
            messagingSenderId: "689403169183",
            appId: "1:689403169183:web:8b61f5cdd78709e11795aa"));
  } else {
    await Firebase.initializeApp();
  }
}
