import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prout_digital_labs/app/models/pokemon_detail.dart';
import 'package:prout_digital_labs/app/models/pokemon_list.dart';
import 'package:prout_digital_labs/app/services/pokemon_service.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController
  PokemonList pokemon = PokemonList();
  ScrollController scrollController = ScrollController();

  PokemonDetail pokemon_detail = PokemonDetail();

  void getList() {
    PokemomService().getPokemon().then((value) {
      pokemon = PokemonList.fromJson(value.body);
      update();
    });
  }

  void getListByUrl(url) {
    PokemomService().getPokemonByUrl(url).then((value) {
      pokemon.next = value.body['next'];
      value.body['results'].forEach((e) {
        pokemon.results!.add(Results.fromJson(e));
      });
      update();
    });
  }

  void getDetail(id) {
    PokemomService().getPokemonDetail(id).then((value) {
      pokemon_detail = PokemonDetail.fromJson(value.body);
      update();
    });
  }

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getList();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        getListByUrl(pokemon.next);
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
