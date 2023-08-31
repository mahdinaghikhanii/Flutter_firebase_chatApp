import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _WelcomeViewGetX();
  }
}

class _WelcomeViewGetX extends GetView<WelcomeController> {
  const _WelcomeViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("WelcomePage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      id: "welcome",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("welcome")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
