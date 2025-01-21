import 'package:fikril_siesta_technical_test/_core/utils/routes/routes.dart';
import 'package:fikril_siesta_technical_test/first_task/presentation/screen/home_screen.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
    ),
  ];
}