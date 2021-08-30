import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:news_app_search/core/network/dio_helper.dart';
import 'core/bloc_observer .dart';
import 'core/themes/dark_theme.dart';
import 'view/splash/view.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News app',
      debugShowCheckedModeBanner: false,
      theme: darkTheme(),
      home: SplashView(), //HomeView(),
    );
  }
}
