import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child:  Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Help and Support",style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(
              height: 50,
            ),
            Text("ambwene@gmail.com"),
            Text("+255715233454"),
          ],
        ),
      ),
    );
  }
}
