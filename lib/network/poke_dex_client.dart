
import 'dart:core';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:flutter_pokedex/data/pokemon_lists.dart';

class PokeDexClient {

  Future<List<PokemonLists>> fetchPokemonList() async {
    try {
      Response<Map<String,dynamic>> response = await Dio().get<Map<String,dynamic>>("https://pokeapi.co/api/v2/pokemon/?offset=0&limit=20");
      print(response);

      List<dynamic>  list = ((response.data["results"]) as List);
      List<PokemonLists> pokemonList = list.map((e) {
        String name = e["name"] as String;
        String url = e["url"] as String;
       return PokemonLists(name,url);
       }).toList();
      return pokemonList;
    } catch (e) {
      print(e);
      return null;
    }
}

  Future<String> getPkImage(String index) async {
    try {
      Response response = await Dio().get( "https://pokeres.bastionbot.org/images/pokemon/$index.png");
      print(response);
      return response.toString();
    } catch (e) {
      print(e);
      return e.toString();
    }
  }
}