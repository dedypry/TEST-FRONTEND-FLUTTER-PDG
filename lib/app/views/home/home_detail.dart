import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prout_digital_labs/app/components/tab_body.dart';
import 'package:prout_digital_labs/app/components/text_header.dart';
import 'package:prout_digital_labs/app/controllers/home_controller.dart';
import 'package:prout_digital_labs/utils/global.dart';

class HomeDetail extends StatelessWidget {
  HomeDetail({super.key});
  final hc = Get.put(HomeController());
  final id = Get.parameters['id'];

  @override
  Widget build(BuildContext context) {
    hc.getDetail(id);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (c) {
            final item = c.pokemon_detail;
            return Container(
              padding: const EdgeInsets.only(
                top: 50,
              ),
              height: size.height,
              decoration: BoxDecoration(
                color: getColorById(int.parse(id!)),
              ),
              child: Stack(
                children: [
                  Positioned(
                    right: -10,
                    top: 50,
                    child: Icon(
                      Icons.catching_pokemon_outlined,
                      size: 200,
                      color: Colors.white.withOpacity(0.3),
                    ),
                  ),
                  TextHeader(item: item, id: id),
                  Positioned(
                    bottom: 0,
                    child: Container(
                        height: size.height * 0.65,
                        width: size.width,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: TabBody(
                          data: c.pokemon_detail,
                        )),
                  ),
                  Positioned(
                    bottom: size.height * 0.6,
                    left: size.width * 0.2,
                    child: Image.network(
                      '$FRONT_URI/$id.png',
                      width: 300,
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
