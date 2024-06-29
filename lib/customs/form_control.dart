import 'package:flutter/material.dart';

class FormControl extends StatefulWidget {
  const FormControl({super.key, required this.label, this.onValidator, required this.controller});
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? onValidator;

  @override
  State<FormControl> createState() => _FormControlState();
}

class _FormControlState extends State<FormControl> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox(
          width: size.width * .8,
          child: TextFormField(
            controller: widget.controller,
            validator: widget.onValidator,
            decoration: InputDecoration(label: Text(widget.label)),
          )),
    );
  }
}
