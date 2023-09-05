import 'package:chatapp/common/constans/constans.dart';
import 'package:chatapp/pages/signin/widgets/btn_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';

class SigninPage extends GetView<SigninController> {
  const SigninPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: Column(
          children: [
            _buildLogo(context),
            _buildThirdPartyLogin(context),
            buttonLoginWidgets(onPressed: () {
              controller.handleSignIn();
            }, context: context)
          ],
        ));
  }

  Widget _buildLogo(context) {
    return Center(
      child: Container(
        width: 110.w,
        margin: EdgeInsets.only(top: 84.h),
        child: Column(
          children: [
            Container(
              width: 76.w,
              height: 76.w,
              margin: EdgeInsets.symmetric(horizontal: 15.w),
              child: Stack(
                children: [
                  Positioned(
                      child: Container(
                          height: 76.w,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      '${AppConstans.baseImage}logo.png')))))
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 15.h, bottom: 15.h),
                child: Text("Let's chat",
                    style: Theme.of(context).textTheme.titleMedium))
          ],
        ),
      ),
    );
  }

  Widget _buildThirdPartyLogin(context) {
    return SizedBox(
      width: 295.w,
      child: Column(
        children: [
          Text("Sign in with social networks",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.grey)),
          Padding(padding: EdgeInsets.only(top: 30.h, left: 50.w, right: 50.w))
        ],
      ),
    );
  }
}
