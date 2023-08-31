import 'package:chatapp/common/routes/routes.dart';
import 'package:chatapp/pages/welcome/biding.dart';
import 'package:chatapp/pages/welcome/index.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(name: AppRoutes.INITIAL, page: () => const WelcomePage(), binding: WelcomeBiding())
  ];
}
