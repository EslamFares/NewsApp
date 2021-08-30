import 'package:flutter/material.dart';

class DetailsTitle extends StatelessWidget {
  final String text;

  const DetailsTitle(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
    );
  }
}
