import 'package:flutter/material.dart';
import 'package:news_app_search/view/search/cubit/cubit.dart';

class FilterAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SearchCubit cubit = SearchCubit.of(context);
    return AnimatedContainer(
      duration: Duration(seconds: 1),
      height: cubit.showFilers ? 230 : 0,
      child: ListView(
        children: [
          RadioListTile(
              title: Text('businessOnly'),
              value: 0,
              groupValue: cubit.group,
              onChanged: cubit.changeGroup),
          RadioListTile(
              title: Text('sportOnly'),
              value: 1,
              groupValue: cubit.group,
              onChanged: cubit.changeGroup),
          RadioListTile(
              title: Text('scienceOnly'),
              value: 2,
              groupValue: cubit.group,
              onChanged: cubit.changeGroup),
          RadioListTile(
              title: Text('all'),
              value: 3,
              groupValue: cubit.group,
              onChanged: cubit.changeGroup),
        ],
      ),
    );
  }
}
