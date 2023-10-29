import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cubit/cubit/cubit.dart';
import 'package:news_app_cubit/cubit/states.dart';
import 'package:webview_flutter_android/webview_flutter_android.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewscreen extends StatelessWidget {
  WebViewscreen({super.key, required this.uri});
  String uri;
  WebViewController controller = WebViewController();
  //  ..loadRequest(Uri.parse(uri));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitNews, States>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(), body: WebViewWidget(controller: controller)),
      );
    });
  }
}
