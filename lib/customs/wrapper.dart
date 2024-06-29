import 'package:boda_fasta/screens/home.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screens/login.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({super.key});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  final stream = FirebaseAuth.instance.authStateChanges();
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: Colors.white,
            child:const Center(child: CircularProgressIndicator()) ,
          );
        } else if (snapshot.hasData) {
          return const Home();
        } else {
          return const LogIn();
        }
      },
    );
  }
}

