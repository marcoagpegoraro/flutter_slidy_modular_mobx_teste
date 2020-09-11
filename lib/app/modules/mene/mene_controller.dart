import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'mene_controller.g.dart';

@Injectable()
class MeneController = _MeneControllerBase with _$MeneController;

abstract class _MeneControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
