import 'package:exam/View/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'View/catalog.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'Firebase',
      options: FirebaseOptions(
          apiKey: 'AIzaSyB5Zts7m9dQpf9Nx3tusZnWKpgdbhYwRxQ',
          appId: '1:696077309550:android:a6bb32eab2c59916f3b87f',
          messagingSenderId: '696077309550',
          projectId: 'lifestyle-e6c19'));
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
