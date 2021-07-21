import 'package:alodjinha/features/banner_list/presenter/app_carousel_slider_component.dart';

import '../../../core/app_ds/atoms/atoms.dart';
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
        body: Stack(
          children: [
            Positioned(
              top: 50,
              width: MediaQuery.of(context).size.width,
              child: LogoWidget(),
            ),
            Positioned(
              bottom: 20,
              width: MediaQuery.of(context).size.width,
              child: IdentificacaoWidget(),
            ),
            Positioned(
              bottom: 60,
              width: MediaQuery.of(context).size.width,
              child: AppCarouselSliderComponent(),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AppImages.logo_sobre),
        Text("a Lodjinha", style: AppTypography.logoSobre),
      ],
    );
  }
}

class IdentificacaoWidget extends StatelessWidget {
  const IdentificacaoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Euclides G. Catunda", style: AppTypography.nomeDesenvolvedor),
        SizedBox(height: 8),
        Text("19 de julho de 2021", style: AppTypography.dataDesenvolvimento),
      ],
    );
  }
}
