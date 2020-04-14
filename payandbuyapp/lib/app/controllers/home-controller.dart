import 'package:mobx/mobx.dart';
part 'home-controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int currentIndex = 0;

  @action
  void navigateToScreens(int index) {
    currentIndex = index;
  }
}
