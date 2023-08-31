import 'package:chatapp/common/routes/routes.dart';
import 'package:chatapp/pages/welcome/state.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
 final state =  WelcomeState();
 WelcomeController();

 changeIndex(int index)async{
  state.index.value = index;
 }


 handleSignIn()async{
 // await ConfigStore.to.saveAlreadyOpen();
  Get.offAndToNamed(AppRoutes.SIGN_IN);
 }
}
