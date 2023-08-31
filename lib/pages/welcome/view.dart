import 'package:chatapp/common/constans/constans.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: Obx(() => SizedBox(
              width: 360.w,
              height: 700.w,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  PageView(
                    scrollDirection: Axis.horizontal,
                    reverse: false,
                    onPageChanged: (index) {
                      controller.changeIndex(index);
                    },
                    controller: PageController(
                        initialPage: 0, keepPage: false, viewportFraction: 1),
                    pageSnapping: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                  '${AppConstans.baseLottie}mobile.json'),
                              const SizedBox(height: 50),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                    "dataFreedom talk to any person with assured privacy",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          )),
                      SizedBox(
                          width: double.infinity,
                          height: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset(
                                  '${AppConstans.baseLottie}chat.json'),
                              const SizedBox(height: 50),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12),
                                child: Text(
                                    "Send text, images, videos and even documents to your friends",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                    textAlign: TextAlign.center),
                              ),
                            ],
                          )),
                      SizedBox(
                        width: double.infinity,
                        height: double.infinity,
                        child: Center(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(
                                '${AppConstans.baseLottie}backend.json'),
                            const SizedBox(height: 50),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                  "   Firebase is an Open-Source self-hosted solution that provides developers with a set of easy-to-use and integrate REST APIs to manage their core backend needs",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                  textAlign: TextAlign.center),
                            ),
                          const  SizedBox(height: 50),
                            SizedBox(
                              width: 240,
                              height: 45,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  
                                ),
                                  onPressed: () {
                                    controller.handleSignIn();
                                  },
                                  child: const Text("Login")),
                            )
                          ],
                        )),
                      ),
                    ],
                  ),
                  Positioned(
                      bottom: 40,
                      child: DotsIndicator(
                        position: controller.state.index.value,
                        dotsCount: 3,
                        reversed: false,
                        decorator: DotsDecorator(
                            size: const Size.square(9),
                            activeSize: const Size(18.0, 9.0),
                            activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        mainAxisAlignment: MainAxisAlignment.center,
                      ))
                ],
              ),
            )));
  }
}
