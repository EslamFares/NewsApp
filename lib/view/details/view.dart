import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_search/view/home/model/news_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'componant/details_img.dart';
import 'componant/details_title.dart';
import 'componant/line.dart';
import 'componant/title_info.dart';

class DetailsView extends StatelessWidget {
  final Articles? articles;
  const DetailsView(this.articles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DetailsView'),
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Center(
            child: ListView(
          children: [
            DetailsImg(articles!.urlToImage),
            DetailsTitle(articles!.title.toString()),
            Line(),
            TitleInfo(title: ":الوصف", info: articles!.description),
            TitleInfo(title: ":المصدر", info: articles!.source!.name),
            TitleInfo(title: ":المالك ", info: articles!.author),
            TitleInfo(
                title: ":التاريخ ",
                info: articles!.publishedAt.toString().split('T')[0]),
            TitleInfo(
                title: ":الوقت ",
                info: articles!.publishedAt
                    .toString()
                    .split('T')[1]
                    .toString()
                    .substring(0, 5)),
            TextButton(
                onPressed: () {
                  launchURL(articles!.url.toString());
                },
                child: Text('!أفتح الخبر في جوجل')) 
          ],
        )),
      ),
    );
  }

  void launchURL(String url) async =>
      await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';
}
