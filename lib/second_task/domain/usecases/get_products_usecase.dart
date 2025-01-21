import '../../data/models/product_model.dart';
import '../../data/repositories/product_repository_impl.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase({required this.repository});

  Future<List<Product>> call({required int page, required int limit}) async {
    return await repository.getProducts(page: page, limit: limit);
  }
}
