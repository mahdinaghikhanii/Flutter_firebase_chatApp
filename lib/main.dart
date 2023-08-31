import 'package:chatapp/common/config/config.dart';
import 'package:chatapp/common/routes/pages.dart';
import 'package:chatapp/common/store/storage.dart';
import 'package:chatapp/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<StorageService>(() => StorageService().init());
  Get.put<ConfigStore>(ConfigStore());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (context, child) => GetMaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                textTheme: TextTheme(
                    titleSmall: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.sp,
                        color: Colors.white),
                    titleMedium: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                        fontSize: 18.sp)),
                colorScheme: ColorScheme.fromSeed(
                    seedColor: Colors.deepPurple,
                    onPrimary: const Color(0xFF2A2A2A)),
                useMaterial3: true,
              ),
              debugShowCheckedModeBanner: false,
              getPages: AppPages.routes,
              initialRoute: AppPages.INITIAL,
            ));
  }
}
