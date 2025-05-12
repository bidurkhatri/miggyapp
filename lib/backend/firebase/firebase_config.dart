import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC8k3CQ5H0zkug1via749fJwNaqB03R5DU",
            authDomain: "miggy-a0ac8.firebaseapp.com",
            projectId: "miggy-a0ac8",
            storageBucket: "miggy-a0ac8.firebasestorage.app",
            messagingSenderId: "473195733929",
            appId: "1:473195733929:web:c68331c7eb81cb0c4d9ab8",
            measurementId: "G-KQEG3VZH6W"));
  } else {
    await Firebase.initializeApp();
  }
}
