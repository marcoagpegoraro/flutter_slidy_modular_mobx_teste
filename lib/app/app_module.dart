import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_teste/app/app_controller.dart';
import 'package:flutter_modular_teste/app/app_widget.dart';
import 'package:flutter_modular_teste/app/modules/home/home_module.dart';
import 'package:flutter_modular_teste/app/modules/other/other_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', module: HomeModule()),
        ModularRouter('/other', child: (_, args) => OtherPage()),
        // ModularRouter('/other/:text',
        //     child: (_, args) => OtherPage(text: args.params['text']))
      ];

  @override
  Widget get bootstrap => AppWidget();
}
