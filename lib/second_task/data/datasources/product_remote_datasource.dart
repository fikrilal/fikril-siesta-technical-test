import '../../../_core/utils/network/api_helper.dart';
import '../models/product_model.dart';
import 'dart:developer';

class ProductRemoteDataSource {
  final ApiHelper apiHelper;

  ProductRemoteDataSource(this.apiHelper);

  Future<List<Product>> fetchProducts({required int page, required int limit}) async {
    try {
      log('RemoteDataSource fetching products: Page $page, Limit $limit', name: 'ProductRemoteDataSource');

      final queryParams = {
        'offset': (page - 1) * limit,
        'limit': limit,
      };
      log('Query Parameters: $queryParams', name: 'ProductRemoteDataSource');

      final response = await apiHelper.getRequest('/products', queryParams: queryParams);

      log('API Response: ${response.data}', name: 'ProductRemoteDataSource');

      final List<dynamic> items = response.data;
      final products = items.map((json) => Product.fromJson(json)).toList();

      log('RemoteDataSource mapped ${products.length} products', name: 'ProductRemoteDataSource');
      return products;
    } catch (e) {
      log('Error fetching products: $e', name: 'ProductRemoteDataSource', level: 3);
      rethrow;
    }
  }
}
