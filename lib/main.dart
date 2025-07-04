import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  if (kIsWeb) {
    Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBEKzcFzXhomc-8hsE9-zV-pqLPUM87QbU",
        authDomain: "for2-e0dc6.firebaseapp.com",
        projectId: "for2-e0dc6",
        storageBucket: "for2-e0dc6.firebasestorage.app",
        messagingSenderId: "11797856287",
        appId: "1:11797856287:web:fdd2decb4b399aa272952a",
      ),
    );
  } else {
    Firebase.initializeApp();
  }

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
