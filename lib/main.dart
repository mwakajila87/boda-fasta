import 'package:firebase_core/firebase_core.dart';
import 'customs/wrapper.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyBcVQMBx99v_ZTCpJNSrEXT-_K9BId_3t0",
          authDomain: "bodafasta-42d35.firebaseapp.com",
          databaseURL: "https://bodafasta-42d35-default-rtdb.firebaseio.com",
          projectId: "bodafasta-42d35",
          storageBucket: "bodafasta-42d35.appspot.com",
          messagingSenderId: "444033483905",
          appId: "1:444033483905:web:d2d6328e276d2df00db980",
          measurementId: "G-81JX6134NH"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BodaFasta',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      home: const Wrapper(),
    );
  }
}
