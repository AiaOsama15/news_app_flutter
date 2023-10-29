import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cubit/cubit/cubit.dart';
import 'package:news_app_cubit/cubit/states.dart';

class SettingView extends StatelessWidget {
  const SettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitNews, States>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //first row
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Change Mood ',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      CircleAvatar(
                        child: IconButton(
                          onPressed: () {
                            CubitNews.get(context).changeMood();
                          },
                          icon: const Icon(Icons.brightness_3, size: 25),
                        ),
                      ),
                    ])
              ],
            ),
          ),
        );
      },
    );
  }
}
