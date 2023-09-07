// ignore_for_file: constant_identifier_names
import 'package:chatapp/common/middlewares/router_welcome.dart';
import 'package:chatapp/common/routes/routes.dart';
import 'package:chatapp/pages/application/index.dart';
import 'package:chatapp/pages/contact/index.dart';
import 'package:chatapp/pages/signin/index.dart';
import 'package:chatapp/pages/welcome/index.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => const WelcomePage(),
        binding: WelcomeBiding(),
        middlewares: [RouteWelcomeMiddleWare(priority: 1)]),
    GetPage(
        name: AppRoutes.SIGN_IN,
        page: () => const SigninPage(),
        binding: SignInBiding()),
    GetPage(
        name: AppRoutes.APPLICATION,
        page: () => const ApplicationPage(),
        binding: ApplicationBinding()),
    GetPage(
        name: AppRoutes.CONTACT,
        page: () => const ContactPage(),
        binding: ContactBinding())
  ];
}
