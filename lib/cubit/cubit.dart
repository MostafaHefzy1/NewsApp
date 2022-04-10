
import'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/cubit/states.dart';
import '../modules/business.dart';
import '../modules/secince.dart';
import '../modules/settings.dart';
import '../modules/sports.dart';
import '../network/global/dio.dart';
import 'package:newsapp/network/local/cashhelper.dart';

class Newscubit extends Cubit <NewsStates> {
  Newscubit() : super(Newsinialstate());

  static Newscubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;

  List<BottomNavigationBarItem> BottomItems =
  [
    BottomNavigationBarItem(
      icon: Icon(
        Icons.business,
      ),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
  ];

  List <Widget> Screens =
  [
    BusinessScreen(),
    SecinesScreen(),
    SportsScreen(),
  ];

  void changBottomNav(int index) {
    if(index == 1)
      getDatascience() ;
    if(index==2)
      getDataSports() ;
    currentIndex = index;
      emit(NewsBottomNavstate());
  }


  List <dynamic> business = [];
  void getDataBusiness() {
    emit(NewsBusinessstateLoading());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query:
        {
          'category': 'business',
          'country': 'eg',
          'apikey': '8b7f0f420fc1463793e350cae32e7404',
        }
    ).then((value) {
      //print(value?.data.toString()) ;
      business = value?.data['articles'];
      //   print(business[0]['title']) ;
      emit(NewsBusinessstateSucess());
    }).catchError((error) {
      print(error.toString());
      emit(NewsBusinessstateFail(error.toString()));
    });
  }


  List <dynamic> Sports = [];
  void getDataSports() {
    emit(NewsBusinessstateLoading());
    if(Sports.length==0)
      {
        DioHelper.getData(
            url: 'v2/top-headlines',
            query:
            {
              'category': 'sports',
              'country': 'eg',
              'apikey': '8b7f0f420fc1463793e350cae32e7404',
            }
        ).then((value) {
          //print(value?.data.toString()) ;
          Sports = value?.data['articles'];
          //  print(business[0]['title']) ;
          emit(NewsBusinessstateSucess());
        }).catchError((error) {
          print(error.toString());
          emit(NewsBusinessstateFail(error.toString()));
        });
      }

  }


  List <dynamic> science = [];
  void getDatascience() {
    emit(NewsscinecestateLoading());
    if(science.length==0)
      {
        DioHelper.getData(
            url: 'v2/top-headlines',
            query:
            {
              'category': 'science',
              'country': 'eg',
              'apikey': '8b7f0f420fc1463793e350cae32e7404',
            }
        ).then((value) {
          science = value?.data['articles'];
          emit(NewsscinecestateSucess());
        }).catchError((error) {
          print(error.toString());
          emit(NewsscinecestateFail(error.toString()));
        });
      }

  }


  List <dynamic> search = [];
  void getDatasearch(String value) {

    emit(NewssearchstateLoading());


    DioHelper.getData(
        url: 'v2/everything',
        query:
        {
          'q': '$value',
          'apikey': '8b7f0f420fc1463793e350cae32e7404',
        }
    ).then((value) {
      search = value?.data['articles'];
      emit(NewssearchstateSucess());
    }).catchError((error) {
      print(error.toString());
      emit(NewssearchsstateFail(error.toString()));
    });

  }




  bool isDark  = false    ;
  void setupDesktop({bool? dark,})
  {
    if(dark!=null)
      isDark = dark ;
    else
      isDark = !isDark;
    cashHelper.putData(key: 'isDark', value: isDark).then((value)
    {
      emit(changeModeState())  ;
    }) ;
  }


}