import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/services/dio_helper.dart';
import 'package:news_app/core/services/shared_prefs_helper.dart';
import 'package:news_app/views/busniess.dart';
import 'package:news_app/views/sciences.dart';
import 'package:news_app/views/sports.dart';

import 'states.dart';

class NewsCubit extends Cubit<States> {
  NewsCubit() : super(InitiStates());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<Widget> views = [
    const BusniessView(),
    const SportsView(),
    const SciencesView(),
  ];

  List<BottomNavigationBarItem> navBarItems = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.business), label: 'Business'),
    const BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    const BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];

  void changeIndex(int index) {
    currentIndex = index;

    emit(ChangeNavBarState());
  }

  List<dynamic> business = [];

  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apiKey': 'bcb4cc3cb09345bc90c96e1ebbc63dd6'
    }).then((value) {
      business = value.data['articles'];
      emit(GetBusinessNewsState());
    }).catchError((error) {
      print("error is ${error.toString()}");
      emit(NewsBusniessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSports() {
    emit(NewsGetSportsLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apiKey': 'bcb4cc3cb09345bc90c96e1ebbc63dd6'
    }).then((value) {
      sports = value.data['articles'];
      emit(GetSportsNewsState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsSportsErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScience() {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apiKey': 'bcb4cc3cb09345bc90c96e1ebbc63dd6'
    }).then((value) {
      science = value.data['articles'];
      emit(GetScienceNewsState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsScienceErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(String searchWord) {
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(url: 'v2/everything', query: {
      'q': '$searchWord',
      'apiKey': 'bcb4cc3cb09345bc90c96e1ebbc63dd6'
    }).then((value) {
      search = value.data['articles'];

      emit(GetSearchNewsState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsSearchErrorState(error.toString()));
    });
  }

  bool isDark = false;

  void changeMode({bool sharedData}) {
    if (sharedData != null) {
      isDark = sharedData;
      emit(AppChangeThemeModeState());
    } else {
      isDark = !isDark;

      SharedPrfsHelper.setData(key: 'isDark', value: isDark)
          .then((value) => emit(AppChangeThemeModeState()));
    }
  }
}
