import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_search/core/themes/dark_theme.dart';
import 'package:news_app_search/view/details/view.dart';
import 'package:news_app_search/widget/news_img.dart';

import 'package:news_app_search/view/home/model/news_model.dart';

class NewsListView extends StatelessWidget {
  // final NewsModel? newsModel;
  final List<Articles>? listData;

  const NewsListView({required this.listData});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return ListView.builder(
        itemCount: listData!.length,
        itemBuilder: (context, index) {
          String? author = listData![index].author;
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          DetailsView(listData![index])));
            },
            child: Container(
              color: dSecColor,
              margin: EdgeInsets.all(5),
              padding: EdgeInsets.all(5),
              width: w,
              height: 110,
              child:
                  Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                NewsImg(listData![index].urlToImage),
                SizedBox(width: 10),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(listData![index].title.toString()),
                        Container(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(author != null
                                ? author.toString().length < 20
                                    ? author.toString()
                                    : '${author.toString().substring(0, 15)}...'
                                : "بدون مصدر"),
                            Text(listData![index].publishedAt
                                .toString()
                                .split('T')[0])
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        });
  }
}
