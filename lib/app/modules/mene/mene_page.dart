import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'mene_controller.dart';

class MenePage extends StatefulWidget {
  final String title;
  final String text;
  const MenePage({Key key, this.title = "Mene", this.text}) : super(key: key);

  @override
  _MenePageState createState() => _MenePageState();
}

class _MenePageState extends ModularState<MenePage, MeneController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text("texto q foi passado por parametro de url: " + widget.text),
          Observer(
            builder: (BuildContext context) {
              return Text('${controller.value}');
            },
          ),
          RaisedButton(
            onPressed: () {
              controller.increment();
            },
            child: Text("Clica em mim"),
          )
        ],
      ),
    );
  }
}
