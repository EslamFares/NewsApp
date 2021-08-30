import 'package:flutter/material.dart';

class TitleInfo extends StatelessWidget {
  final String? title, info;

  const TitleInfo({this.title, this.info});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(title.toString(),
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.right),
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Text(info != null ? info.toString() : '...لا يوجد',
              style: TextStyle(fontSize: 16), textAlign: TextAlign.right),
        ),
      ],
    );
  }
}