import 'package:chatapp/common/entities/user.dart';
import 'package:chatapp/common/routes/routes.dart';
import 'package:chatapp/common/store/user.dart';
import 'package:chatapp/pages/signin/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
        final _gAuthentication = await user.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _gAuthentication.idToken,
            accessToken: _gAuthentication.accessToken);
        await FirebaseAuth.instance.signInWithCredential(_credential);
        String displayName = user.displayName ?? user.email;
        String email = user.email;
        String id = user.id;
        String photoUrl = user.photoUrl ?? "";
        UserLoginResponseEntity userProfile = UserLoginResponseEntity();
        userProfile.email = email;
        userProfile.accessToken = id;
        userProfile.disPlayName = displayName;
        userProfile.photoUrl = photoUrl;

        UserStore.to.saveProfile(userProfile);
        var userBase = await db
            .collection("users")
            .withConverter(
                fromFirestore: UserData.fromFireStore,
                toFirestore: (UserData userData, options) =>
                    userData.toFireStore())
            .where("id", isEqualTo: id)
            .get();

        if (userBase.docs.isEmpty) {
          final data = UserData(
              id: id,
              name: displayName,
              email: email,
              photoUrl: photoUrl,
              location: "",
              fcmToken: "",
              addTiem: Timestamp.now());
          await db
              .collection("users")
              .withConverter(
                  fromFirestore: UserData.fromFireStore,
                  toFirestore: (UserData userData, options) =>
                      userData.toFireStore())
              .add(data);
        }
        Get.snackbar("Success", "Login success", backgroundColor: Colors.green);

        Get.offAndToNamed(AppRoutes.APPLICATION);
      }
    } catch (e) {
      Get.snackbar("Error", "Login Failed", backgroundColor: Colors.red);
    }
  }

  @override
  void onReady() {
    super.onReady();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("User is currentlu log Out");
      } else {
        print("User is logged in");
      }
    });
  }

  signOut() async {
    await _googleSignIn.signOut();
    await FirebaseAuth.instance.signOut();
  }
}
