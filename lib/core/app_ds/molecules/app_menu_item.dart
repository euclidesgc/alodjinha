import 'package:alodjinha/core/app_ds/atoms/atoms.dart';
import 'package:flutter/material.dart';

class AppMenuItem extends StatelessWidget {
  final String title;
  final Widget? leading;
  final Function onTap;

  const AppMenuItem(
    this.title, {
    required this.onTap,
    Key? key,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: Text(
        this.title,
        style: AppTypography.menuItem,
      ),
      onTap: () => onTap(),
    );
  }
}
