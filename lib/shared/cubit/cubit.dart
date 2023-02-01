import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../modules/business/business.dart';
import '../../modules/science/science.dart';
import '../../modules/sports/sports.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(InitialState());
  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
List<BottomNavigationBarItem> bottomItem = [

        BottomNavigationBarItem(
    icon:Icon(Icons.business_rounded),
    label: 'Business',
  ),
        BottomNavigationBarItem(
          icon:Icon(Icons.sports_rounded),
          label: 'Sports',
        ),
        BottomNavigationBarItem(
    icon:Icon(Icons.science_rounded),
    label: 'Science',
  ),
];

List<Widget> screen = [
  business_screen(),
  sports_screen(),
  science_screen(),
];

void changeBottomNav(int index){
  currentIndex = index;
  if(index == 1)
    getSports();

  if(index == 2)
    getScience();
  emit(ChangeNavBottomState());
}
//https://newsapi.org/v2/top-headlines?country=eg&category=business&apikey=65f7f556ec76449fa7dc7c0069f040ca
List<dynamic> business = [];
  void getBusiness(){
  emit(NewsBusinessLoadingState());
  DioHelper.getData(
      url: 'v2/top-headlines', query: {
    "country":"eg",
    "category":"business",
    "apiKey":"65f7f556ec76449fa7dc7c0069f040ca" ,
  }).then((value) {
   business =value.data['articles'];
    emit(NewsGetBusinessSuccessState());
  }).catchError((error){
    print(error.toString());
    emit(NewsGetBusinessErrorState(error.toString()));
  }
  );

}

  List<dynamic> sports = [];
  void getSports(){
    emit(NewsSportsLoadingState());
    if(sports.length ==0){
      DioHelper.getData(

          url: 'v2/top-headlines', query: {
        "country":"eg",
        "category":"sports",
        "apiKey":"65f7f556ec76449fa7dc7c0069f040ca" ,
      }).then((value) {
        sports =value.data['articles'];
      }).catchError((error){
        print(error.toString());
        emit(NewsGetSportsErrorState(error.toString()));
      }
      );
    }else{emit(NewsGetSportsSuccessState());}
  }

  List<dynamic> science = [];
  void getScience(){
    emit(NewsScienceLoadingState());
    if(science.length==0){
      DioHelper.getData(
          url: 'v2/top-headlines', query: {
        "country":"eg",
        "category":"science",
        "apiKey":"65f7f556ec76449fa7dc7c0069f040ca" ,
      }).then((value) {
        science =value.data['articles'];
      }).catchError((error){
        print(error.toString());
        emit(NewsGetScienceErrorState(error.toString()));
      }
      );
    }else{emit(NewsGetScienceSuccessState());}
  }

  List<dynamic> search = [];
  void getSearch(String value) {
    search=[];
    emit(NewsGetSearchLoadingState());

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q':value,
          'apiKey':'b0e42a877703422aa36a61e1f7a2fd5e',
        }).then((value) {
      search = value.data['articles'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error)
    {
      emit(NewsGetSearchErrorState(error.toString()))
      ;});

  }
}