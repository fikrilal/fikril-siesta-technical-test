import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../../../_core/utils/network/api_helper.dart';
import '../../../_core/utils/network/dio_client.dart';
import '../../data/datasources/product_remote_datasource.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/usecases/get_products_usecase.dart';
import '../controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Dio>(() => DioClient(Dio()).dio);

    Get.lazyPut<ApiHelper>(() => ApiHelper(Get.find<Dio>()));

    Get.lazyPut<ProductRemoteDataSource>(() => ProductRemoteDataSource(Get.find<ApiHelper>()));

    Get.lazyPut<ProductRepository>(
        () => ProductRepository(remoteDataSource: Get.find<ProductRemoteDataSource>()));

    Get.lazyPut<GetProductsUseCase>(() => GetProductsUseCase(repository: Get.find<ProductRepository>()));

    Get.lazyPut<ProductController>(
        () => ProductController(getProductsUseCase: Get.find<GetProductsUseCase>()));
  }
}
