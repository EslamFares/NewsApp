import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_search/widget/error_view.dart';
import 'package:news_app_search/widget/news_list_view.dart';
import 'package:news_app_search/view/sports/cubit/cubit.dart';
import 'package:news_app_search/view/sports/state/state.dart';

class SportsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SportCubit, SportStates>(
      builder: (context, state) {
        SportCubit cubit = SportCubit.of(context);
        if (state is SLoadingState) {
          return CupertinoActivityIndicator();
        } else if (state is SErrorState) {
          return Errorview();
        } else {
          return NewsListView(
            listData: cubit.sportData!.articles,
          );
        }
      },
    );
  }
}
