import 'package:chatapp/common/config/config.dart';
import 'package:chatapp/common/routes/routes.dart';
import 'package:chatapp/common/store/user.dart';
import 'package:flutter/widgets.dart';
import 'package:get/route_manager.dart';

class RouteWelcomeMiddleWare extends GetMiddleware {
  @override
  int? priority = 0;
  RouteWelcomeMiddleWare({required this.priority});

  @override
  RouteSettings? redirect(String? route) {
    if (ConfigStore.to.isFirstOpen == false) {
      return null;
    } else if (UserStore.to.isLogin == true) {
      return const RouteSettings(name: AppRoutes.APPLICATION);
    } else {
      return const RouteSettings(name: AppRoutes.SIGN_IN);
    }
  }
}
