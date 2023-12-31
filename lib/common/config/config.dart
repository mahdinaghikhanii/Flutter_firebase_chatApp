import 'package:chatapp/common/store/storage.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();
  bool isFirstOpen = false;
  PackageInfo? _platForm;

  @override
  void onInit() {
    super.onInit();
    isFirstOpen = StorageService.to.getBool('STORAGE_DEVICE_FIRST_OPEN_KEY');
  }

  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool("STORAGE_DEVICE_FIRST_OPEN_KEY", true);
  }
}
   