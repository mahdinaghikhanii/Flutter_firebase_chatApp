import 'package:chatapp/common/entities/user.dart';
import 'package:chatapp/common/store/user.dart';
import 'package:chatapp/pages/signin/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        Get.showSnackbar(const GetSnackBar(
            title: "Success",
            message: "Login success",
            backgroundColor: Colors.green));
      }
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
            title: "Error",
            message: "Login Failed",
            backgroundColor: Colors.red));
    }
  }
}
