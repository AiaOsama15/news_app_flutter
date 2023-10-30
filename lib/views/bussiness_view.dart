import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app_cubit/cubit/cubit.dart';
import 'package:news_app_cubit/cubit/states.dart';
import 'package:news_app_cubit/widget/build_item_news.dart';

// ignore: must_be_immutable
class BussinessView extends StatelessWidget {
  BussinessView({super.key});

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNews, States>(
        listener: (BuildContext context, state) {
      if (State is LoadingState) {
        loading = true;
      }
    }, builder: (BuildContext context, state) {
      return CubitNews.get(context).listOfBussinessDate == null
          ? const Scaffold(
              body: Center(
                child: CircularProgressIndicator(
                  color: Color.fromARGB(255, 209, 25, 212),
                ),
              ),
            )
          : Scaffold(
              body: ListView.separated(
                  itemBuilder: (context, int index) {
                    return buildItemOfNews(
                        mapOneItem:
                            CubitNews.get(context).listOfBussinessDate![index],
                        context: context);
                  },
                  separatorBuilder: (context, int index) {
                    return const Divider(
                      height: 2,
                      color: Colors.grey,
                    );
                  },
                  itemCount:
                      CubitNews.get(context).listOfBussinessDate!.length));
    });
  }
}
