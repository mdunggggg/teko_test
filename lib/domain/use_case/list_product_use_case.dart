import 'package:teko_hiring_test/domain/entities/product_entity.dart';
import 'package:teko_hiring_test/domain/repositories/product_repository.dart';

class ListProductUseCase {
  final ProductRepository _productRepository;

  ListProductUseCase(this._productRepository);

  Future<List<ProductEntity>> call({required int offset, required int limit}) {
    return _productRepository.getProducts(offset: offset, limit: limit);
  }
}