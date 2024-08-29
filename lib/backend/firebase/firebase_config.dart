import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDo9BgLtuort12btZ9lrqC_UOPAOu-KcvA",
            authDomain: "easymeals-4cd85.firebaseapp.com",
            projectId: "easymeals-4cd85",
            storageBucket: "easymeals-4cd85.appspot.com",
            messagingSenderId: "1079884436695",
            appId: "1:1079884436695:web:fb62183473e5af84360c92",
            measurementId: "G-TXJHK7H88Q"));
  } else {
    await Firebase.initializeApp();
  }
}
