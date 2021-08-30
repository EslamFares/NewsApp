import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_search/view/business/cubit/cubit.dart';
import 'package:news_app_search/view/business/state/state.dart';
import 'package:news_app_search/widget/error_view.dart';
import '../../widget/news_list_view.dart';

class BusinessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BusinessCubit, BusinessStates>(
      builder: (context, state) {
        BusinessCubit cubit = BusinessCubit.of(context);
        if (state is LoadingState) {
          return CupertinoActivityIndicator();
        } else if (state is ErrorState) {
          return Errorview();
        } else {
          return NewsListView(
            listData: cubit.bussinessData!.articles,
          );
        }
      },
    );
  }
}
