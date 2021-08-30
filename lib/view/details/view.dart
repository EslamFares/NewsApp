import 'package:flutter/material.dart';
import 'package:news_app_search/view/home/model/news_model.dart';

class DetailsView extends StatelessWidget {
  final Articles? articles;
  const DetailsView(this.articles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailsView'),
      ),
      body: Center(child: Text(articles!.title.toString())),
    );
  }
}
