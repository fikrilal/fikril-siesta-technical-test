import 'dart:developer';
import 'package:fikril_siesta_technical_test/second_task/domain/usecases/get_products_usecase.dart';
import 'package:get/get.dart';
import '../../data/models/product_model.dart';

class ProductController extends GetxController {
  final GetProductsUseCase getProductsUseCase;
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var isRefreshing = false.obs;
  var currentPage = 1.obs;
  final int limit = 10;

  ProductController({required this.getProductsUseCase});

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      log('Fetching products: Page ${currentPage.value}, Limit $limit', name: 'ProductController');
      isLoading.value = true;

      final newProducts = await getProductsUseCase(page: currentPage.value, limit: limit);

      log('Fetched ${newProducts.length} products from page ${currentPage.value}', name: 'ProductController');

      if (newProducts.isNotEmpty) {
        products.addAll(newProducts);
        currentPage.value++;
        log('Updated current page to ${currentPage.value}', name: 'ProductController');
      } else {
        log('No more products to fetch (empty response)', name: 'ProductController');
      }
    } catch (e) {
      log('Error in ProductController: $e', name: 'ProductController', level: 3);
    } finally {
      isLoading.value = false;
      log('Fetching products complete', name: 'ProductController');
    }
  }

  Future<void> refreshProducts() async {
    try {
      isLoading.value = true;
      isRefreshing.value = true;
      currentPage.value = 1;
      products.clear();
      final newProducts = await getProductsUseCase(page: currentPage.value, limit: limit);
      if (newProducts.isNotEmpty) {
        products.addAll(newProducts);
        currentPage.value++;
      }
    } catch (e) {
      log('Error refreshing products: $e', name: 'ProductController', level: 3);
    } finally {
      isLoading.value = false;
      isRefreshing.value = false;
    }
  }
}
