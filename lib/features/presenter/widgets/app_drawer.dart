import 'package:alodjinha/core/app_ds/molecules/molecules.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/app_ds/atoms/atoms.dart';
import '../../../core/app_ds/molecules/app_drawer_header.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: <Widget>[
        AppDrawerHeader(),
        AppMenuItem(
          "Home",
          leading: Icon(
            AppIcons.home,
            color: AppColors.warmPurple,
          ),
          onTap: () {
            Modular.to.navigate("/");
            Modular.to.pop();
          },
        ),
        AppMenuItem(
          "Sobre o aplicativo",
          leading: Icon(
            AppIcons.ticket,
            color: AppColors.warmPurple,
          ),
          onTap: () {
            Modular.to.navigate("/sobre");
            Modular.to.pop();
          },
        ),
      ],
    ));
  }
}
