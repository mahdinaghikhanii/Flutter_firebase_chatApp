import 'dart:convert';

import 'package:chatapp/common/entities/user.dart';
import 'package:chatapp/common/store/storage.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  final _isLogin = false.obs;
  String token = '';
  final _profile = UserLoginResponseEntity().obs;

  bool get isLogin => _isLogin.value;
  UserLoginResponseEntity get profile => _profile.value;
  bool get hasToken => token.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    token = StorageService.to.getString("STORAGE_USER_TOKEN_KEY");
    var profileOffline =
        StorageService.to.getString("STORAGE_USER_PROFILE_KEY");
    if (profileOffline.isNotEmpty) {
      _isLogin.value = true;
      _profile(UserLoginResponseEntity.fromJson(jsonDecode(profileOffline)));
    }
  }

  Future<void> setToken(String value) async {
    await StorageService.to.setString("STORAGE_USER_TOKEN_KEY", value);
    token = value;
  }

  Future<String> getProfile() async {
    if (token.isEmpty) return "";
    return StorageService.to.getString('STORAGE_USER_PROFILE_KEY');
  }

  Future<void> saveProfile(UserLoginResponseEntity profile) async {
    _isLogin.value = true;
    StorageService.to
        .setString("STORAGE_USER_PROFILE_KEY", jsonEncode(profile));
  }

  Future<void> onLogOut() async {}
}
