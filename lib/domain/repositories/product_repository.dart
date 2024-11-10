import 'package:teko_hiring_test/domain/entities/component_entity.dart';
import 'package:teko_hiring_test/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ComponentEntity>> getManagements();

  Future<List<ProductEntity>> getProducts({
    required int offset,
    required int limit,
  });

  Future<int> insertProduct(ProductEntity product);
}
