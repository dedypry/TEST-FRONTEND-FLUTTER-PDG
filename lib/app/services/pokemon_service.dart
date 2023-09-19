import 'package:get/get.dart';

class PokemomService extends GetConnect {
  var URI = 'https://pokeapi.co/api/v2/';

  Future<Response> getPokemon() => get('${URI}pokemon?offset=0&limit=20');
  Future<Response> getPokemonByUrl(url) => get(url);
  Future<Response> getPokemonDetail(id) => get('${URI}pokemon/${id}');
}
