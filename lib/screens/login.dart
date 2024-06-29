import 'package:boda_fasta/customs/buttons.dart';
import 'package:boda_fasta/screens/home.dart';
import 'package:boda_fasta/screens/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../customs/form_control.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final auth = FirebaseAuth.instance;
  final email = TextEditingController();
  final password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Boda Fasta",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: size.width * .65,
                child: Image.network(
                    "https://cdni.iconscout.com/illustration/premium/thumb/motorbike-race-7480402-6104193.png?f=webp"),
              ),
              const SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      Text(
                        "Log In",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 40),
                      ),
                      Text('Fill the following form to sign in')
                    ],
                  )),
              FormControl(
                label: "Email",
                controller: email,
                onValidator: (val) {
                  if (val!.isEmpty) {
                    return "Email should not be empty";
                  }
                  // Regular expression for email validation
                  String pattern = r'^[^@]+@[^@]+\.[^@]+';
                  RegExp regex = RegExp(pattern);
                  if (!regex.hasMatch(val)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
              FormControl(
                label: "Password",
                controller: password,
                onValidator: (val) {
                  if (val!.isEmpty) {
                    return "Password is required";
                  }
                },
              ),
              AuthButton(
                text: 'Sign In',
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    SnackBar snackBar = const SnackBar(content: Text(''));
                    await auth
                        .signInWithEmailAndPassword(
                            email: email.text, password: password.text)
                        .then((value) {
                      print(value);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              ),
              AuthTextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignUp()));
                  },
                  text: "If already have an account, Register here.")
            ],
          ),
        ),
      ),
    ));
  }
}
