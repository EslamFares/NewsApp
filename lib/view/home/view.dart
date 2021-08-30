import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_search/view/business/cubit/cubit.dart';
import 'package:news_app_search/view/home/cubit/cubit.dart';
import 'package:news_app_search/view/home/state/state.dart';
import 'package:news_app_search/view/sciece/cubit/cubit.dart';
import 'package:news_app_search/view/sports/cubit/cubit.dart';
import 'componant/bottom_nav.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => BusinessCubit()..getBusiness()),
        BlocProvider(create: (context) => SportCubit()..getSport()),
        BlocProvider(create: (context) => ScienceCubit()..getScience()),
      ],
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          HomeCubit cubit = HomeCubit.of(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              centerTitle: false,
              actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
            ),
            body: Center(
              child: cubit.body[cubit.currentIndex],
            ),
            bottomNavigationBar: BottomNav(),
          );
        },
      ),
    );
  }
}
