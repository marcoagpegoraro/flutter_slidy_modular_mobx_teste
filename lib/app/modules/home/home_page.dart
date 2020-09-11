import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_teste/app/modules/home/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          onChanged: (value) {
            homeController.text = value;
          },
          decoration: InputDecoration(labelText: "um texto qualquer"),
        ),
      ),
      body: Observer(
        builder: (BuildContext context) {
          if (homeController.pokemons.error != null)
            return Center(
              child: RaisedButton(
                child: Text("Press again"),
                onPressed: () {
                  homeController.fetchPokemon();
                },
              ),
            );
          if (homeController.pokemons.value == null)
            return Center(
              child: CircularProgressIndicator(),
            );

          var list = homeController.pokemons.value;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(title: Text(list[index].name));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Modular.to.pushNamed("/other");
          Modular.to.pushNamed("/mene/" + homeController.text);
        },
      ),
    );
  }
}
