import 'package:flutter/material.dart';

class TripsScreen extends StatefulWidget {
  const TripsScreen({super.key});

  @override
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Trips",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
