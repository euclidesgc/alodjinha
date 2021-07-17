import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/app_ui/app_ui.dart';
import 'app_drawer_header.dart';

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
        ListTile(
          leading: Icon(
            AppIcons.home,
            color: AppColors.warmPurple,
          ),
          title: Text("Home"),
          onTap: () {
            Modular.to.navigate("/");
            Modular.to.pop();
          },
        ),
        ListTile(
          leading: Icon(
            AppIcons.ticket,
            color: AppColors.warmPurple,
          ),
          title: Text("Sobre o aplicativo"),
          onTap: () {
            Modular.to.navigate("/sobre");
            Modular.to.pop();
          },
        ),
      ],
    ));
  }
}
