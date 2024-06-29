import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.text, this.onPressed});
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: colorScheme.background),
            onPressed: onPressed,
            child: Text(text)),
      ),
    );
  }
}

class AuthTextButton extends StatelessWidget {
  const AuthTextButton({super.key, required this.text, this.onPressed});
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(foregroundColor: Colors.black),
        child: Text(text));
  }
}
