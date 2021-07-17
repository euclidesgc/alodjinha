import 'package:alodjinha/features/presenter/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/app_ui/app_ui.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              SizedBox(width: 8),
              Image.asset(
                AppImages.logo_menu,
                // height: 28,
              ),
              SizedBox(width: 8),
              Text(
                "a Lodjinha",
                style: AppTypography.logoMenu,
              ),
            ],
          ),
          backgroundColor: AppColors.warmPurple,
          centerTitle: false,
        ),
        drawer: AppDrawer(),
        body: Container(
          child: Text("HomePage"),
        ),
      ),
    );
  }
}
