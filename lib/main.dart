import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cubit/cubit/cubit.dart';
import 'package:news_app_cubit/cubit/states.dart';
import 'package:news_app_cubit/network/dio.dart';
import 'package:news_app_cubit/network/sharedpref.dart';
import 'package:news_app_cubit/views/news_home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  Cash.init();
  bool savedMood =
      Cash.getDateFromShared(keyofsetDateToShared: 'isDark') as bool;
  runApp(
    BlocProvider(
      create: (context) => CubitNews()
        ..getBussinessDate()
        ..changeMood(savedMood: savedMood),
      child: MyApp(savedMood),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(savedMood, {super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarBrightness: Brightness.light,
    ));

    return BlocBuilder<CubitNews, States>(
      builder: (context, state) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: CubitNews.get(context).isDark
                ? ThemeMode.light
                : ThemeMode.dark,
            title: 'Flutter Demo',
            darkTheme: ThemeData(
              scaffoldBackgroundColor: Colors.black38,
              primarySwatch: Colors.indigo,
              appBarTheme: const AppBarTheme(
                iconTheme: IconThemeData(color: Colors.white),
                elevation: 0,
                titleSpacing: 7.0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                color: Color.fromARGB(255, 103, 5, 105),
              ),
              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: Colors.white),
                // bodyLarge: TextStyle(color: Colors.white),
              ),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  backgroundColor: Colors.black38),
            ),
            theme: ThemeData(
                scaffoldBackgroundColor: Colors.white,
                primarySwatch: Colors.indigo,
                textTheme: const TextTheme(
                  bodyMedium: TextStyle(color: Colors.black),
                  // bodyLarge: TextStyle(color: Colors.white),
                ),
                appBarTheme: const AppBarTheme(
                  elevation: 0,
                  titleSpacing: 7.0,
                  titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  color: Color.fromARGB(255, 215, 132, 216),
                ),
                bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    backgroundColor: Colors.white)),
            home: const NewsHomeView());
      },
    );
  }
}
