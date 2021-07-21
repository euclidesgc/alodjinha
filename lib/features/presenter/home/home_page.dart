import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/app_ds/atoms/atoms.dart';
import '../../banner_list/presenter/app_carousel_slider_component.dart';
import '../widgets/app_drawer.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  @override
  void initState() {
    super.initState();
    controller.getDados();
    print("Pegou dados");

    // reaction((_) => controller.bannerListFailure, (failure) {
    //   controller.bannerListFailure.map((a) {
    //     //Exibir mensagem de erro!
    //     print("Errou: $a");
    //   });
    // });

    reaction((_) => controller.categoryListFailure, (failure) {
      controller.categoryListFailure.map((a) {
        //Exibir mensagem de erro!
        print("Errou: $a");
      });
    });
  }

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
              Text("a Lodjinha", style: AppTypography.logoMenu),
            ],
          ),
          backgroundColor: AppColors.warmPurple,
          centerTitle: false,
        ),
        drawer: AppDrawer(),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppCarouselSliderComponent(),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Categorias",
                  style: AppTypography.descricaoProdutoBold,
                ),
              ),
              Divider(color: AppColors.greyish),
              Observer(builder: (_) {
                return Container(
                  padding: EdgeInsets.all(8),
                  height: 115,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.listCategories.length,
                    itemBuilder: (context, i) {
                      return Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 8),
                            height: 70,
                            width: 120,
                            // child: Image.network(controller.listCategories[i].urlImagem),
                            child: CachedNetworkImage(
                              imageUrl: controller.listCategories[i].urlImagem,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                          Text(
                            controller.listCategories[i].descricao,
                            style: AppTypography.nomeCategoria,
                          ),
                        ],
                      );
                    },
                  ),
                );
              }),
              Divider(color: AppColors.greyish),
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 16),
                child: Text(
                  "Mais vendidos",
                  style: AppTypography.descricaoProdutoBold,
                  textAlign: TextAlign.start,
                ),
              ),
              Divider(color: AppColors.greyish),
            ],
          ),
        ),
      ),
    );
  }
}
