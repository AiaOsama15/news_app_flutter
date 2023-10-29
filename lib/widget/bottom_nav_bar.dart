import 'package:flutter/material.dart';
import 'package:news_app_cubit/cubit/cubit.dart';

Widget bottomNavBarWidget(context) {
  return BottomNavigationBar(
    items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.business_center), label: "Business"),
      BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sport"),
      BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
    ],
    iconSize: 27,
    selectedItemColor: const Color.fromARGB(255, 218, 43, 191),
    unselectedItemColor: Colors.grey,
    currentIndex: CubitNews.get(context).bottomIndex,
    elevation: 55.0,
    onTap: (int index) {
      CubitNews.get(context).changeBottonNav(index);
    },
    type: BottomNavigationBarType.fixed,
  );
}
