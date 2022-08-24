import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/cubit/states.dart';
import 'package:news/modules/business.dart';
import 'package:news/modules/health.dart';
import 'package:news/modules/science.dart';
import 'package:news/modules/setting.dart';
import 'package:news/modules/sports.dart';
import 'package:news/modules/technology.dart';

import '../network/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context) => BlocProvider.of(context);

  // Bottom NavBar

  int currentIndex = 0;
  List<Widget> screens =
  [
    Business_Screen(),
    Sports_Screen(),
    Science_Screen(),
    Technology_Screen(),
    Health_Screen(),
  ];

  void ChangeIndex(int index)
  {
   currentIndex = index;
   if(index == 1)
   {
     getSports();
   }
   if(index == 2)
   {
     getSience();
   }
   if(index == 3)
   {
     getTechnology();
   }
   if(index == 4)
   {
     getHealth();
   }
   emit(BottomNavBarState());
  }


 // Api Part

  // business
  List<dynamic> business = [];

  void getBusiness()
  {
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        "country":"eg",
        "category":"business",
        "apiKey":"beaf25f8d2f844f8a63df0ef14b7ab5a",
      },
    ).then((value)
    {
      business = value.data['articles'];
      print(business.length);
      // print(value.data.toString());
      emit(NewsGetBusinessSucsessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

 // sports
  List<dynamic> sports = [];

  void getSports()
  {
    emit(NewsGetSportLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        "country":"eg",
        "category":"sports",
        "apiKey":"beaf25f8d2f844f8a63df0ef14b7ab5a",
      },
    ).then((value)
    {
      sports = value.data['articles'];
      print(sports.length);
      // print(value.data.toString());
      emit(NewsGetSportSucsessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSportErrorState(error.toString()));
    });
  }

  // science
  List<dynamic> science = [];

  void getSience()
  {
    emit(NewsGetScienceLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        "country":"eg",
        "category":"science",
        "apiKey":"beaf25f8d2f844f8a63df0ef14b7ab5a",
      },
    ).then((value)
    {
      science = value.data['articles'];
      print(science.length);
      // print(value.data.toString());
      emit(NewsGetScienceSucsessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  // technology
  List<dynamic> Technology = [];

  void getTechnology()
  {
    emit(NewsGetTechLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        "country":"eg",
        "category":"technology",
        "apiKey":"beaf25f8d2f844f8a63df0ef14b7ab5a",
      },
    ).then((value)
    {
      Technology = value.data['articles'];
      print(Technology.length);
      // print(value.data.toString());
      emit(NewsGetTechSucsessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetTechErrorState(error.toString()));
    });
  }

  // health

  List<dynamic> Health = [];

  void getHealth()
  {
    emit(NewsGetHealthLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        "country":"eg",
        "category":"health",
        "apiKey":"beaf25f8d2f844f8a63df0ef14b7ab5a",
      },
    ).then((value)
    {
      Health = value.data['articles'];
      print(Health.length);
      // print(value.data.toString());
      emit(NewsGetHealthSucsessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetHealthErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void Search(String value)
  {
    emit(NewsGetSearchLoadingState());
    search = [];

    DioHelper.getData(
      url: 'v2/everything',
      query: {
        "q":"$value",
        "apiKey":"beaf25f8d2f844f8a63df0ef14b7ab5a",
      },
    ).then((value)
    {
      search = value.data['articles'];
      print(search.length);
      // print(value.data.toString());
      emit(NewsGetSearchSucsessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }


}