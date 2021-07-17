import 'package:alodjinha/core/app_ui/app_colors.dart';
import 'package:alodjinha/features/presenter/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class SobrePage extends StatefulWidget {
  const SobrePage({Key? key}) : super(key: key);

  @override
  _SobrePageState createState() => _SobrePageState();
}

class _SobrePageState extends State<SobrePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("sobre"),
          backgroundColor: AppColors.warmPurple,
          centerTitle: false,
        ),
        drawer: AppDrawer(),
        body: Container(
          child: Text("Sobre"),
        ),
      ),
    );
  }
}
