import 'dart:developer';
import '../datasources/product_remote_datasource.dart';
import '../models/product_model.dart';

class ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepository({required this.remoteDataSource});

  Future<List<Product>> getProducts({required int page, required int limit}) async {
    try {
      log('Repository fetching products: Page $page, Limit $limit', name: 'ProductRepository');
      final products = await remoteDataSource.fetchProducts(page: page, limit: limit);
      log('Repository fetched ${products.length} products for Page $page', name: 'ProductRepository');
      return products;
    } catch (e) {
      log('Error in repository: $e', name: 'ProductRepository', level: 3);
      rethrow;
    }
  }
}
