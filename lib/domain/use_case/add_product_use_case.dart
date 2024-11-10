import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class AddProductUseCase {
  final ProductRepository _productRepository;
  AddProductUseCase(this._productRepository);

  Future<int> call(ProductEntity product) {
    return _productRepository.insertProduct(product);
  }
}