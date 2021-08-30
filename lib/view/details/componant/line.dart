import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
        width: w,
        height: 2,
        color: Colors.grey,
        margin: EdgeInsets.symmetric(vertical: 10));
  }
}
