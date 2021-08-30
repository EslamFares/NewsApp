import 'package:flutter/material.dart';

class Errorview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.airplanemode_inactive,
          size: 100,
          color: Colors.grey,
        ),
        SizedBox(height: 20),
        Text('Error in fetch Data ...'),
      ],
    );
  }
}
