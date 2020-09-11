import 'mene_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'mene_page.dart';

class MeneModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $MeneController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute + ":text",
            child: (_, args) => MenePage(text: args.params['text'])),
      ];

  static Inject get to => Inject<MeneModule>.of();
}
