import 'package:flutter_modular_teste/app/modules/other/other_page.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular_teste/app/app_widget.dart';
import 'package:flutter_modular_teste/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
        ModularRouter('/other', child: (_, args) => OtherPage()),
        // ModularRouter('/other/:text',
        //     child: (_, args) => OtherPage(text: args.params['text']))
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
