import 'package:flutter_modular_teste/app/shared/models/poke.dart';
import 'package:flutter_modular_teste/app/shared/repositories/poke_repository.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokeRepository pokeRepository;

  @observable
  ObservableFuture<List<Poke>> pokemons;

  _HomeControllerBase(this.pokeRepository) {
    fetchPokemon();
  }

  @action
  fetchPokemon() {
    pokemons = pokeRepository.getAllPokemons().asObservable();
  }

  String text = '';
}
