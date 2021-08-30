import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_search/const/conts.dart';
import 'package:news_app_search/core/network/dio_helper.dart';
import 'package:news_app_search/view/home/model/news_model.dart';
import 'package:news_app_search/view/sports/state/state.dart';

class SportCubit extends Cubit<SportStates> {
  SportCubit() : super(SportInitState());
  static SportCubit of(context) => BlocProvider.of(context);
  //=============================
  NewsModel? sportData;
  Future<void> getSport() async {
    print('go' * 10);
    emit(SLoadingState());
    try {
      var resonse = await DioHelper.getData(
          url: '/v2/top-headlines?country=eg&category=sport&apiKey=$apiKey',
          query: {});
      sportData = NewsModel.fromJson(resonse.data);
      emit(SDataComeState());
      print('=>>>>>>>>>>>> ${sportData!.articles!.length}');
    } catch (e) {
      print('eroooooooooooooooor');
      emit(SErrorState());
    }
  }
}
