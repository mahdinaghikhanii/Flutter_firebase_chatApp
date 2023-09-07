import 'package:chatapp/common/entities/user.dart';
import 'package:chatapp/common/store/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'index.dart';

class ContactController extends GetxController {
  ContactController();
  final state = ContactState();
  final db = FirebaseFirestore.instance;
  final token = UserStore.to.token;

  asyncLoadAllData() async {
    var userBase = await db
        .collection("users")
        .where("id", isNotEqualTo: token)
        .withConverter(
            fromFirestore: UserData.fromFireStore,
            toFirestore: (UserData userdata, option) => userdata.toFireStore())
        .get();

    for (var doc in userBase.docs) {
      state.contactList.add(doc.data());
    }
  }

  @override
  void onReady() {
    super.onReady();
    asyncLoadAllData();
  }
}
