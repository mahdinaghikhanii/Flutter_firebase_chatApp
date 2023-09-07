import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class ContactPage extends GetView<ContactController> {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: 0.w, horizontal: 0.w),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
            var item = controller.state.contactList[index];
            return buildListItem(item);
          }, childCount: controller.state.contactList.length)),
        )
      ],
    ));
  }
}
