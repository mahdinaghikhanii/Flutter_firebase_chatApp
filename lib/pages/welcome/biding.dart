import 'package:chatapp/pages/welcome/index.dart';
import 'package:get/get.dart';

class WelcomeBiding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WelcomeController>(() => WelcomeController());
  }
}