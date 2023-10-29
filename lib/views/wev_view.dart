import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_cubit/cubit/cubit.dart';
import 'package:news_app_cubit/cubit/states.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class WebViewscreen extends StatelessWidget {
  WebViewscreen({super.key, required this.uri});
  String uri;
  // late WebViewController webViewController;

  late WebViewController webViewController = WebViewController()
    ..loadRequest(Uri.parse(uri));

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitNews, States>(builder: (context, state) {
      return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            body: WebViewWidget(controller: webViewController)),
      );
    });
  }
}
