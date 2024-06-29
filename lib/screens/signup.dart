import 'package:boda_fasta/screens/home.dart';
import 'package:boda_fasta/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../customs/buttons.dart';
import '../customs/form_control.dart';
import '../model/bfuser.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String userType = "customer";
  final auth = FirebaseAuth.instance;
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final rePassword = TextEditingController();
  final license = TextEditingController();
  final formKey = GlobalKey<FormState>();


  storeUserToDatabase({required String userKey}){
    final ref = FirebaseDatabase.instance.ref();  

    final BFUser user = BFUser(
     fullname:name.text,
      email : email.text,
      type: userType,
      license : license.text.isNotEmpty ? license.text : null,
      createdAt: DateTime.now().microsecondsSinceEpoch
    );
    ref.child('users').child(userKey).set(user.toJson());
  }



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
                width: size.width * .35,
                child: Image.network(
                    "https://cdni.iconscout.com/illustration/premium/thumb/motorbike-race-7480402-6104193.png?f=webp"),
              ),
              const SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 40),
                      ),
                      Text('Fill the following form to sign up')
                    ],
                  )),
              FormControl(
                label: "Fullname",
                controller: name,
                onValidator: (val) {
                  if (val!.isEmpty) {
                    return "Name should not be empty";
                  }
                  return null;
                },
              ),
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
              userType == 'rider'
                  ? FormControl(
                      label: "License Number",
                      controller: license,
                      onValidator: (val) {
                        if (val!.isEmpty) {
                          return "License Number should not be empty";
                        }
                        return null;
                      },
                    )
                  : const SizedBox(),
              FormControl(
                controller: password,
                label: "Password",
                onValidator: (val) {
                  // print(val);
                  if (val!.isEmpty) {
                    return "Password should not be empty";
                  } else if (val.length < 8) {
                    return "Password should be at least 8 characters long";
                  } else if (!RegExp(r'(?=.*[A-Z])').hasMatch(val)) {
                    return "Password should contain at least one uppercase letter";
                  } else if (!RegExp(r'(?=.*[!@#$%^&*(),.?":{}|<>])')
                      .hasMatch(val)) {
                    return "Password should contain at least one symbol";
                  }
                  return null;
                },
              ),
              FormControl(
                label: "Confirm Password",
                controller: rePassword,
                onValidator: (val) {
                  if (val!.isEmpty) {
                    return "Confirm password should not be empty";
                  } else if (val != password.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },
              ),
              const Text(
                "Select User Type",
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Radio(
                          value: "customer",
                          groupValue: userType,
                          onChanged: (val) {
                            setState(() {
                              userType = val!;
                            });
                          }),
                      const Text("Customer")
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                          value: "rider",
                          groupValue: userType,
                          onChanged: (val) {
                            setState(() {
                              userType = val!;
                            });
                          }),
                      const Text("Rider")
                    ],
                  )
                ],
              ),
              AuthButton(
                text: 'Sign Up',
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    SnackBar snackBar = const SnackBar(
                        content: Text('You have successfully registered.'));
                    auth
                        .createUserWithEmailAndPassword(
                            email: email.text, password: password.text)
                        .then((value) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                                                    storeUserToDatabase(userKey: value.user!.uid);
                    }).onError((error, stackTrace) {
                      snackBar = const SnackBar(
                          content: Text("Error occured, registration failed."));
                    });
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              ),
              AuthTextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => const LogIn()));
                  },
                  text: "If you have no registered account, Log In.")
            ],
          ),
        ),
      ),
    ));
  }
}
