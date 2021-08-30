import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_search/const/conts.dart';
import 'package:news_app_search/core/network/dio_helper.dart';
import 'package:news_app_search/view/business/state/state.dart';
import 'package:news_app_search/view/home/model/news_model.dart';

class BusinessCubit extends Cubit<BusinessStates> {
  BusinessCubit() : super(BusinessInitState());
  static BusinessCubit of(context) => BlocProvider.of(context);
  //=============================
  static List<Articles> searchListB = [];
//=========================
  NewsModel? bussinessData;
  Future<void> getBusiness() async {
    print('go' * 10);
    emit(LoadingState());
    print('############${searchListB.length}');
    try {
      var resonse = await DioHelper.getData(
          url: '/v2/top-headlines?country=eg&category=business&apiKey=$apiKey',
          query: {});
      bussinessData = NewsModel.fromJson(resonse.data);
      bussinessData!.articles!.forEach((element) => searchListB.add(element));
      emit(BDataComeState());
      print('=>>>>>>>>>>>> ${bussinessData!.articles!.length}');
      print('############${searchListB.length}');
    } catch (e) {
      print('eroooooooooooooooor');
      emit(ErrorState());
    }
  }
}
