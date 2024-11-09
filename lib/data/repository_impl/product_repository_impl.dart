import 'package:teko_hiring_test/data/mapper/component_mapper.dart';
import 'package:teko_hiring_test/data/remotes/products_remote.dart';
import 'package:teko_hiring_test/domain/entities/component_entity.dart';

import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {

  ProductRepositoryImpl(this.productRemote, this.componentMapper);
  final ProductRemote productRemote;
  final ComponentMapper componentMapper;

  @override
  Future<List<ComponentEntity>> getManagements() async {
    final res = await productRemote.getManagements();
    return componentMapper.mapToListEntity(res.data);
  }

}