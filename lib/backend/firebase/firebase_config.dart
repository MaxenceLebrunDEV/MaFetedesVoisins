import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDlvAoGpAgSPZdYavMFDoV-EFwOA-09SOo",
            authDomain: "mafetedesvoisins.firebaseapp.com",
            projectId: "mafetedesvoisins",
            storageBucket: "mafetedesvoisins.appspot.com",
            messagingSenderId: "374673093630",
            appId: "1:374673093630:web:1ed399ec08c4e3784406af",
            measurementId: "G-F9F9H315MG"));
  } else {
    await Firebase.initializeApp();
  }
}
