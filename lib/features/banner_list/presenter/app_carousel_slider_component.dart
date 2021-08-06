import 'package:alodjinha/features/banner_list/presenter/app_carousel_slider_controller.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

class AppCarouselSliderComponent extends StatefulWidget {
  const AppCarouselSliderComponent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppCarouselSliderComponentState();
  }
}

class _AppCarouselSliderComponentState extends ModularState<
    AppCarouselSliderComponent, AppCarouselSliderController> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();

    // controller.getBannerList();

    reaction((_) => controller.bannerListFailure, (failure) {
      controller.bannerListFailure.map((a) {
        //Exibir mensagem de erro!
        print("Errou: $a");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: controller.getBannerList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final List<Widget> imageSliders = controller.bannerList
                .map((item) => GestureDetector(
                      child: Image.network(item.urlImagem),
                      onTap: () => print("Abrir link: ${item.linkUrl}"),
                    ))
                .toList();

            return Container(
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Stack(
                    children: [
                      CarouselSlider(
                        items: imageSliders,
                        carouselController: _controller,
                        options: CarouselOptions(
                            autoPlay: true,
                            disableCenter: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                            enlargeCenterPage: true,
                            aspectRatio: 5,
                            initialPage: 0,
                            pageSnapping: true,
                            enableInfiniteScroll: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                _current = index;
                              });
                            }),
                      ),
                      Positioned(
                        bottom: 0,
                        left: MediaQuery.of(context).size.width / 2.5,
                        height: 25,
                        child: Row(
                          children: controller.bannerList
                              .asMap()
                              .entries
                              .map((entry) {
                            return GestureDetector(
                              onTap: () => _controller.animateToPage(entry.key),
                              child: Container(
                                width: 12.0,
                                height: 12.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 8.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: (Theme.of(context).brightness !=
                                                Brightness.dark
                                            ? Colors.white
                                            : Colors.black)
                                        .withOpacity(
                                            _current == entry.key ? 0.9 : 0.4)),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
