import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_teste/app/modules/home/home_controller.dart';
import 'package:flutter_modular_teste/app/modules/home/home_page.dart';
import 'package:flutter_modular_teste/app/shared/repositories/poke_repository.dart';
import 'package:flutter_modular_teste/app/shared/utils/constants.dart';

class HomeModule extends ChildModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<PokeRepository>())),
        Bind((i) => PokeRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  // TODO: implement routers
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
      ];
}
