import 'dart:convert';
import 'package:boda_fasta/model/bfuser.dart';
import 'package:boda_fasta/screens/screen_search.dart';
import 'package:boda_fasta/screens/screen_trips.dart';
import 'package:boda_fasta/screens/support.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref();
  int activeScreen = 0;


  Widget currentScreen(int index){

    if(index == 0){
      return const SearchScreen();
    }else if(index == 1){
      return const TripsScreen();
    }else{
      return const SupportScreen();
    }
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ref.child('users').child(auth.currentUser!.uid).onValue,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: const Center(child: CircularProgressIndicator()),
            );
          } else if (snapshot.hasData &&
              snapshot.data!.snapshot.value != null) {
            Map<String, dynamic> data =
                jsonDecode(jsonEncode(snapshot.data!.snapshot.value))
                    as Map<String, dynamic>;
            BFUser user = BFUser.fromJson(data);
            return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  title: const Text("Home | BodaFasta"),
                ),
                drawer: Drawer(
                  child: Column(
                    children: [
                      DrawerHeader(
                          child: Column(
                        children: [
                          const Text(
                            "Boda Fasta",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Image.asset('assets/images/icon.png', height: 100),
                        ],
                      )),
                      Text(
                        "Welcome ${user.fullname}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            DrawerItem(
                              isSelected: activeScreen == 0,
                              title: "Home",
                              onTap: () {
                                setState(() {
                                  activeScreen =0;
                                });
                              },
                            ),
                            DrawerItem(
                              isSelected: activeScreen == 1,
                              title: "Trips",
                              onTap: () {
                                setState(() {
                                  activeScreen = 1;
                                });
                              },
                            ),
                            DrawerItem(
                              isSelected: activeScreen == 2,
                              title: "Support",
                              onTap: () {
                                setState(() {
                                  activeScreen = 2;
                                });
                              },
                            ),
                            DrawerItem(
                              title: "Log Out",
                              onTap: () {
                                auth.signOut();
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                body: currentScreen(activeScreen));
          } else {
            return Container(
              color: Colors.white,
              child: const Center(
              child: CircularProgressIndicator(),
            ),
            );
          }
        });
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {super.key, required this.title, this.onTap, this.isSelected = false});
  final String title;
  final bool isSelected;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected,
      selectedTileColor: Colors.amber,
      onTap: onTap,
      title: Text(title),
    );
  }
}