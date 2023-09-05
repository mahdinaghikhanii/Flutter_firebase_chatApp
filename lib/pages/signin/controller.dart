import 'package:chatapp/common/entities/user.dart';
import 'package:chatapp/common/store/user.dart';
import 'package:chatapp/pages/signin/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(scopes: <String>['openid']);

class SigninController extends GetxController {
  final state = SignInState();
  SigninController();
  final db = FirebaseFirestore.instance;
  Future<void> handleSignIn() async {
    try {
      var user = await _googleSignIn.signIn();
      if (user != null) {
        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? "";
        UserLoginResponseEntity userProfile = UserLoginResponseEntity();
        userProfile.emai = email;
        userProfile.accessToken = id;
        userProfile.disPlayName = displayName;
        userProfile.photoUrl = photoUrl;
        UserStore.to.saveProfile(userProfile);
      }
    } catch (e) {}
  }
}
