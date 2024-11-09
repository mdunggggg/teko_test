import 'package:teko_hiring_test/domain/entities/component_entity.dart';

abstract class ProductRepository {
  Future<List<ComponentEntity>> getManagements();
}