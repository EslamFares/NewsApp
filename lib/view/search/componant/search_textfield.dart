import 'package:flutter/material.dart';
import 'package:news_app_search/view/search/cubit/cubit.dart';
import 'package:news_app_search/view/search/widget/border_text_feild.dart';

class SearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SearchCubit cubit = SearchCubit.of(context);
    return Container(
      height: 55,
      child: TextFormField(
        onChanged: cubit.search,
        controller: cubit.searchController,
        validator: (value) {
          if (value.toString().isEmpty) {
            return 'email is empty!!';
          }
          if (value.toString().length < 1) {
            return 'minimum digits 7!!';
          } else
            return null;
        },
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'الأهلى',
          labelText: 'search',
          enabledBorder: outLineBorder(color: Colors.blueGrey),
          errorBorder: outLineBorder(color: Colors.red),
          focusedBorder: outLineBorder(),
          disabledBorder: outLineBorder(),
          focusedErrorBorder: outLineBorder(),
        ),
      ),
    );
  }
}
