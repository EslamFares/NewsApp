import 'package:flutter/material.dart';
import 'package:news_app_search/view/search/componant/search_textfield.dart';
import 'package:news_app_search/view/search/cubit/cubit.dart';

class SearchRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SearchCubit cubit = SearchCubit.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 55,
        child: Row(
          children: [
            Expanded(child: SearchTextField()),
            SizedBox(width: 10),
            SizedBox(width: 10),
            Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: IconButton(
                    onPressed: () {
                      cubit.changeShowFilers();
                    },
                    icon: Icon(cubit.showFilers
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,size: 30,)))
          ],
        ),
      ),
    );
  }
}
