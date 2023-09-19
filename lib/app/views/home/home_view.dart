import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:prout_digital_labs/utils/global.dart';

import '../../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (_c) {
          return Scaffold(
            body: CustomScrollView(
              controller: _c.scrollController,
              slivers: [
                SliverAppBar(
                  expandedHeight: 150,
                  floating: true,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: false,
                    titlePadding: const EdgeInsets.only(
                      left: 30,
                      bottom: 20,
                      right: 30,
                    ),
                    title: const Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Pokedex',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          'By Dedy Priyatna',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    background: Stack(
                      children: [
                        Positioned(
                          right: 0,
                          bottom: -50,
                          child: Icon(
                            Icons.catching_pokemon_rounded,
                            size: 200,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Center(
                        child: Wrap(
                          children: [
                            for (var item in _c.pokemon.results ?? [])
                              GestureDetector(
                                onTap: () => Get.toNamed(
                                    '/home/${getNumber(item.url!)}'),
                                child: Container(
                                  padding: const EdgeInsets.all(3),
                                  child: Container(
                                    width: size.width * 0.4,
                                    height: 150,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 2,
                                      horizontal: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: getColor(item.url!),
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.8),
                                            offset: Offset(2, 2),
                                            blurRadius: 2,
                                            spreadRadius: 2)
                                      ],
                                    ),
                                    child: Stack(
                                      children: [
                                        Positioned(
                                          right: -10,
                                          bottom: -10,
                                          child: Icon(
                                            Icons.catching_pokemon_rounded,
                                            size: 130,
                                            color:
                                                Colors.white.withOpacity(0.3),
                                          ),
                                        ),
                                        Positioned(
                                          top: 20,
                                          left: 10,
                                          child: Text(
                                            capitalizeWords(item.name!),
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 3,
                                          bottom: 10,
                                          child: SvgPicture.network(
                                            getUrl(item.url!),
                                            width: 80,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
