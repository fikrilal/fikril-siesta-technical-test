import 'package:fikril_siesta_technical_test/_core/presentation/screen/main_screen.dart';
import 'package:fikril_siesta_technical_test/_core/utils/routes/routes.dart';
import 'package:fikril_siesta_technical_test/first_task/presentation/screen/home_screen.dart';
import 'package:fikril_siesta_technical_test/second_task/presentation/screen/product_list_screen.dart';
import 'package:fikril_siesta_technical_test/third_task/presentation/bindings/task_binding.dart';
import 'package:fikril_siesta_technical_test/third_task/presentation/screen/to_do_list_screen.dart';
import 'package:get/get.dart';
import '../../../second_task/presentation/binding/product_binding.dart';

class AppRoutes {
  static final routes = [
    GetPage(
      name: Routes.mainScreen,
      page: () => const MainScreen(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: Routes.productListScreen,
      page: () => const ProductListScreen(),
      binding: ProductBinding(),
    ),
    GetPage(
      name: Routes.toDoListScreen,
      page: () => const ToDoListScreen(),
      binding: TaskBinding(),
    ),
  ];
}