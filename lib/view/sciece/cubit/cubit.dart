import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_search/const/conts.dart';
import 'package:news_app_search/core/network/dio_helper.dart';
import 'package:news_app_search/view/home/model/news_model.dart';
import 'package:news_app_search/view/sciece/state/state.dart';

class ScienceCubit extends Cubit<ScienceStates> {
  ScienceCubit() : super(ScienceInitState());
  static ScienceCubit of(context) => BlocProvider.of(context);
  //=============================
  static List<Articles> searchListSc = [];
//=========================
  NewsModel? scienceData;
  Future<void> getScience() async {
    print('go' * 10);
    emit(ScienceLoadingState());
    try {
      var resonse = await DioHelper.getData(
          url: '/v2/top-headlines?country=eg&category=science&apiKey=$apiKey',
          query: {});
      scienceData = NewsModel.fromJson(resonse.data);
      scienceData!.articles!.forEach((element) => searchListSc.add(element));
      emit(ScienceDataComeState());
      print('=>>>>>>>>>>>> ${scienceData!.articles!.length}');
    } catch (e) {
      print('eroooooooooooooooor');
      emit(ScienceErrorState());
    }
  }
}
