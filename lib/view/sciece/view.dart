import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_search/view/sciece/cubit/cubit.dart';
import 'package:news_app_search/view/sciece/state/state.dart';
import 'package:news_app_search/widget/error_view.dart';
import 'package:news_app_search/widget/news_list_view.dart';

class ScienceView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScienceCubit, ScienceStates>(
      builder: (context, state) {
        ScienceCubit cubit = ScienceCubit.of(context);
        if (state is ScienceLoadingState) {
          return CupertinoActivityIndicator();
        } else if (state is ScienceErrorState) {
          return Errorview();
        } else {
          return NewsListView(
            listData: cubit.scienceData!.articles,
          );
        }
      },
    );
  }
}
