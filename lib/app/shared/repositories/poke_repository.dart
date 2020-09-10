import 'package:dio/dio.dart';
import 'package:flutter_modular_teste/app/shared/models/poke.dart';

class PokeRepository {
  final Dio dio;
  PokeRepository(this.dio);

  Future<List<Poke>> getAllPokemons() async {
    var response = await dio.get('/pokemon');
    List<Poke> list = [];

    for (var json in response.data['results']) {
      Poke poke = Poke(name: json['name']);
      list.add(poke);
    }

    return list;
  }
}
