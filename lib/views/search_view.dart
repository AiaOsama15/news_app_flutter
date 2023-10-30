import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cubit/cubit/cubit.dart';
import 'package:news_app_cubit/cubit/states.dart';
import 'package:news_app_cubit/widget/build_item_news.dart';
import 'package:news_app_cubit/widget/custom_text_field.dart';

// ignore: must_be_immutable
class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  GlobalKey<FormState> myFormKey = GlobalKey();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitNews, States>(
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    customTextField(
                        labeltext: 'search',
                        onChanged: (value) {
                          setState(() {});
                          print(value);
                          CubitNews.get(context).getSearchDate(value);
                        }),
                    CubitNews.get(context).listSearchDate == null
                        ? const Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: CircularProgressIndicator(
                                  color: Color.fromARGB(255, 209, 25, 212),
                                ),
                              ),
                            ],
                          )
                        : Expanded(
                            child: ListView.separated(
                                itemBuilder: (context, int index) {
                                  return buildItemOfNews(
                                      mapOneItem: CubitNews.get(context)
                                          .listSearchDate![index]);
                                },
                                separatorBuilder: (context, int index) {
                                  return const Divider(
                                    height: 2,
                                    color: Colors.grey,
                                  );
                                },
                                itemCount: 12),
                          ),
                  ],
                ),
              )),
        );
      },
    );
  }
}
