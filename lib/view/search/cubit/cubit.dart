import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_search/view/business/cubit/cubit.dart';
import 'package:news_app_search/view/home/model/news_model.dart';
import 'package:news_app_search/view/sciece/cubit/cubit.dart';
import 'package:news_app_search/view/search/state/state.dart';
import 'package:news_app_search/view/sports/cubit/cubit.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitState());
  static SearchCubit of(context) => BlocProvider.of(context);
  //======================
  List<Articles> searchList = [];
  List<Articles> searchList2 = [];
  //======================
  bool showFilers = false;
  changeShowFilers() {
    showFilers = !showFilers;
    emit(ShowFilersState());
  }

//========================
  final searchController = TextEditingController();
  int group = 0;
  void changeGroup(value) {
    group = value;
    emit(RidoState());

    if (value == 0) {
      searchList = BusinessCubit.searchListB;
     search(searchController.text);
    } else if (value == 1) {
      searchList = SportCubit.searchListS;
       search(searchController.text);
    } else if (value == 2) {
      searchList = ScienceCubit.searchListSc;
       search(searchController.text);
    } else {
      searchList = BusinessCubit.searchListB +
          SportCubit.searchListS +
          ScienceCubit.searchListSc;
           search(searchController.text);
    }
    emit(FillSearchListState());
  }
//====================
  void getSearchList() {
    searchList = BusinessCubit.searchListB +
        SportCubit.searchListS +
        ScienceCubit.searchListSc;
    print(searchList.length);
    emit(FillSearchListState());
  }

  void search(value) {
    searchList2.clear();
    searchList.forEach((element) {
      if (element.title
              .toString()
              .toLowerCase()
              .contains(value.toString().toLowerCase()) ||
          element.description
              .toString()
              .toLowerCase()
              .contains(value.toString().toLowerCase()) ||
          element.author
              .toString()
              .toLowerCase()
              .contains(value.toString().toLowerCase())) {
        searchList2.add(element);
      }
    });
    emit(SearchState());
  }
}
