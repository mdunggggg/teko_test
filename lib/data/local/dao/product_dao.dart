import 'package:floor/floor.dart';
import 'package:teko_hiring_test/domain/entities/product_entity.dart';

@dao
abstract class ProductDao {
  @insert
  Future<int> insertProduct(ProductEntity product);
  @Query('SELECT * FROM ProductEntity')
  Future<List<ProductEntity>> getProducts();

  @Query('SELECT * FROM ProductEntity LIMIT :offset,:limit')
  Future<List<ProductEntity>> getProductsByOffsetAndLimit(int offset, int limit);
}