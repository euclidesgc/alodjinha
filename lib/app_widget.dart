import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) =>
        getErrorWidget(context, errorDetails);

    return MaterialApp(
      initialRoute: "/",
    ).modular();
  }
}

Widget getErrorWidget(BuildContext context, FlutterErrorDetails error) {
  return Center(
    child: Text(
      "Error appeared."
      "${error.toString()}",
      style:
          Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white),
    ),
  );
}
