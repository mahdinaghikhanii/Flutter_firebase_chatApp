import 'package:chatapp/pages/signin/index.dart';
import 'package:get/get.dart';

class SignInBiding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(() => SigninController());
  }
}