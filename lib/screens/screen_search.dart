import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Home",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(

              ),
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: const Radius.circular(14),topRight: Radius.circular(14)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 0.5,
                    spreadRadius: 0.5,
                    offset: Offset(-.24, -2.0)
                    
                  )
                ]
              ),
              padding: const EdgeInsets.symmetric(vertical: 20),
              height: 200,
              child: Column(children: [ 

              const Text("Where are you heading?"),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search)
                  ),
                )
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber
                ),
                 child: const Text("Search")),
              )

              ],),
            )
          ],
        ),
      ),
    );
  }
}