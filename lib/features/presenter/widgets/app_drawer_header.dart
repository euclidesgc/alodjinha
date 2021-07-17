import '../../../../core/app_ui/app_ui.dart';
import 'package:flutter/material.dart';

class AppDrawerHeader extends StatelessWidget {
  const AppDrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Stack(
        children: [
          Positioned(
            top: 20,
            left: 8,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.tomato,
              child: Image.asset(AppImages.logo_menu),
            ),
          ),
          Positioned(
              bottom: 8,
              right: 0,
              child: Text(
                "a Lodjinha",
                style: AppTypography.logoMenu,
              ))
        ],
      ),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.menu_pattern),
        ),
        color: AppColors.warmPurple,
      ),
    );
  }
}
