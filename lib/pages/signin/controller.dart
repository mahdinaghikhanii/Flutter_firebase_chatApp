import 'package:chatapp/pages/signin/index.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'openid'
  ]
);
class SigninController extends GetxController {
  final state  = SignInState();
  SigninController();
}
