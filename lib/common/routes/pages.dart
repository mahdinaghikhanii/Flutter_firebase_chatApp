// ignore_for_file: constant_identifier_names
import 'package:chatapp/common/routes/routes.dart';
import 'package:chatapp/pages/signin/index.dart';
import 'package:chatapp/pages/welcome/index.dart';
import 'package:get/route_manager.dart';

class AppPages {
  static const INITIAL = AppRoutes.INITIAL;
  static final List<GetPage> routes = [
    GetPage(
        name: AppRoutes.INITIAL,
        page: () => const WelcomePage(),
        binding: WelcomeBiding()),
    GetPage(
        name: AppRoutes.SIGN_IN,
        page: () => const SigninPage(),
        binding: SignInBiding())
  ];
}
