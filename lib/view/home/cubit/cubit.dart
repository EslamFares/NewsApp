import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_search/view/business/view.dart';
import 'package:news_app_search/view/home/model/news_model.dart';
import 'package:news_app_search/view/home/state/state.dart';
import 'package:news_app_search/view/sciece/view.dart';
import 'package:news_app_search/view/sports/view.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitState());
  static HomeCubit of(context) => BlocProvider.of(context);
  //=============================
  int currentIndex = 0;
  void changeIndex(value) {
    currentIndex = value;
    emit(BottomIndexState());
  }

  //==============
  List<Widget> body = [BusinessView(), SportsView(), ScienceView()];
//==========================
  static List<Articles> searchList = [];
}
