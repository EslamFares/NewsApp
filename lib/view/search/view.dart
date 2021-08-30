import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_search/view/home/model/news_model.dart';
import 'package:news_app_search/view/search/componant/filter_animation.dart';
import 'package:news_app_search/view/search/cubit/cubit.dart';
import 'package:news_app_search/view/search/state/state.dart';
import 'package:news_app_search/widget/news_list_view.dart';
import 'componant/search_row.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit()..getSearchList(),
      child: BlocConsumer<SearchCubit, SearchStates>(
          listener: (context, state) {},
          builder: (context, state) {
            SearchCubit cubit = SearchCubit.of(context);
            List<Articles> list = cubit.searchController.text.isEmpty
                ? cubit.searchList
                : cubit.searchList2;
            return Scaffold(
                appBar: AppBar(
                  title: Text('Search'),
                ),
                body: Column(
                  children: [
                    SearchRow(),
                    FilterAnimation(),
                    Expanded(
                        child: list.isEmpty
                            ? Center(child: Text('NoData'))
                            : NewsListView(
                                listData: list,
                              ))
                  ],
                ));
          }),
    );
  }
}
