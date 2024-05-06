import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:symptoscan/onboard.dart';
import 'package:symptoscan/healthTips.dart';
import 'LoginScreen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDIH2j0aCaGsPKia4Eyxt8RJ4SKS0N3I3Y",
              appId: "1:65940199642:android:ef2aad26c56a2baeeeade3",
              messagingSenderId: "65940199642",
              projectId: "symptoscan-3fa23"),
        )
      : Firebase.initializeApp(); // Initialize Firebase
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: onBoard(),
    );
  }
}
