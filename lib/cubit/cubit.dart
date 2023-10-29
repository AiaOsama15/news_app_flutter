import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app_cubit/cubit/states.dart';
import 'package:news_app_cubit/network/dio.dart';
import 'package:news_app_cubit/network/sharedpref.dart';
import 'package:news_app_cubit/views/bussiness_view.dart';
import 'package:news_app_cubit/views/science_view.dart';
import 'package:news_app_cubit/views/setting_view.dart';
import 'package:news_app_cubit/views/sport_view.dart';

// one apiKey
class CubitNews extends Cubit<States> {
  int bottomIndex = 0;
  List listOfViews = [
    BussinessView(),
    SportView(),
    ScienceView(),
    const SettingView()
  ];
  List listOfTitle = [
    'Bussiness News',
    'Sport News',
    'Science News',
    'Settings'
  ];
  CubitNews() : super(InitState());

  static CubitNews get(context) => BlocProvider.of(context);
  changeBottonNav(int index) {
    bottomIndex = index;
    emit(ChangeBottonNavState());
    if (bottomIndex == 1) {
      getSportDate();
    }
    if (bottomIndex == 2) {
      getSciencetDate();
    }
  }

  List<dynamic>? listOfBussinessDate;
  List<dynamic>? listOfSportsDate;
  List<dynamic>? listOfSienceDate;
  getBussinessDate() {
    emit(LoadingState());
    DioHelper.getDate(url: 'v2/top-headlines', queryParameter: {
      'country': 'us',
      'category': 'sports',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      listOfBussinessDate = value.data["articles"];
      // print('value from get $listOfBussinessDate');
      // print('value from get ${value.data}');
      emit(GetBussinessDataSuccessState());
    }).catchError((error) {
      emit(GetBussinessDataErrorState());
      print('error from get bussiness : $error');
    });
  }

  //
  getSportDate() {
    emit(LoadingSportState());
    DioHelper.getDate(url: 'v2/top-headlines', queryParameter: {
      'country': 'us',
      'category': 'science',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      listOfSportsDate = value.data["articles"];
      // print('value from get $listOfSportsDate');
      // print('value from get ${value.data}');
      emit(GetSportsDataSuccessState());
    }).catchError((error) {
      emit(GetSportsDataErrorState());
      print('error from get bussiness : $error');
    });
  }

  //science
  getSciencetDate() {
    emit(LoadingSinceState());
    DioHelper.getDate(url: 'v2/top-headlines', queryParameter: {
      'country': 'us',
      'category': 'science',
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      listOfSienceDate = value.data["articles"];
      // print('value from get $listOfSienceDate');
      // print('value from get ${value.data}');
      emit(GetSienceDataSuccessState());
    }).catchError((error) {
      emit(GetSienceDataErrorState());
      print('error from get bussiness : $error');
    });
  }

  bool isDark = false;
  changeMood({bool? savedMood}) {
    if (savedMood != null) {
      isDark = savedMood;
      ChangeMoodState();
    } else {
      isDark = !isDark;
      Cash.setDateToShared(
              keyofsetDateToShared: 'isDark', valueofsetDateToShared: isDark)
          .then(
        (value) => emit(
          ChangeMoodState(),
        ),
      );
    }
  }

  //search
  List? listSearchDate;
  getSearchDate(String value) async {
    emit(LoadingSearchState());
    DioHelper.getDate(url: 'v2/everything', queryParameter: {
      'q': value,
      'apiKey': '65f7f556ec76449fa7dc7c0069f040ca',
    }).then((value) {
      listSearchDate = value.data["articles"];
      // print('value from get $listOfSienceDate');
      // print('value from get ${value.data}');
      emit(GetSearchDataSuccessState());
    }).catchError((error) {
      emit(GetSearchDataErrorState());
      print('error from get search : $error');
    });
  }
}
