import 'package:flutter/material.dart';
import 'package:news_app_search/core/themes/dark_theme.dart';
import 'package:news_app_search/view/home/cubit/cubit.dart';

class BottomNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    HomeCubit cubit = HomeCubit.of(context);
    return BottomNavigationBar(
      currentIndex: cubit.currentIndex,
      onTap: cubit.changeIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.trending_up),
          label: 'business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_esports),
          label: 'sports',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.science),
          label: 'science',
        )
      ],
      backgroundColor: dSecColor,
      selectedItemColor: Colors.blue,
    );
  }
}
