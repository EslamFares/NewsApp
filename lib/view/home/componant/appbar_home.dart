import 'package:flutter/material.dart';
import 'package:news_app_search/view/search/view.dart';

AppBar appBarHome(context) {
  return AppBar(
    title: Text('News App'),
    centerTitle: false,
    actions: [
      IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SearchView()));
          },
          icon: Icon(Icons.search))
    ],
  );
}
