import 'package:teko_hiring_test/domain/entities/component_entity.dart';
import 'package:teko_hiring_test/domain/repositories/product_repository.dart';

class GetTekoTestUseCase {
  GetTekoTestUseCase(this._productRepository);
  final ProductRepository _productRepository;

  Future<List<ComponentEntity>> call() async {
    return _productRepository.getManagements();
  }

}