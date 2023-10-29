import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cubit/cubit/cubit.dart';
import 'package:news_app_cubit/cubit/states.dart';
import 'package:news_app_cubit/views/search_view.dart';
import 'package:news_app_cubit/widget/bottom_nav_bar.dart';

class NewsHomeView extends StatefulWidget {
  const NewsHomeView({super.key});

  @override
  State<NewsHomeView> createState() => _NewsHomeViewState();
}

class _NewsHomeViewState extends State<NewsHomeView> {
  @override
  Widget build(BuildContext context) {
    //BlocBuilder<CubitNews, State>(builder: (context, state) {

    return BlocBuilder<CubitNews, States>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 198, 92, 199),
                  child: IconButton(
                      icon: const Icon(
                        Icons.search,
                        size: 28,
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (BuildContext context) {
                          return SearchView();
                        }));
                      }),
                ),
                const SizedBox(
                  width: 9,
                ),
              ],
              title: Text(CubitNews.get(context)
                  .listOfTitle[CubitNews.get(context).bottomIndex]),
            ),
            body: CubitNews.get(context)
                .listOfViews[CubitNews.get(context).bottomIndex],
            bottomNavigationBar: bottomNavBarWidget(context)),
      );
    });
  }
}
