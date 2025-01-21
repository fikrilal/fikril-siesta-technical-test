import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import '_core/utils/routes/app_routes.dart';
import '_core/utils/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      useInheritedMediaQuery: true,
      minTextAdapt: true,
      designSize: const Size(360, 800),
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.mainScreen,
          getPages: AppRoutes.routes,
        );
      },
    );
  }
}
