import 'package:teko_hiring_test/data/local/dao/product_dao.dart';
import 'package:teko_hiring_test/data/mapper/component_mapper.dart';
import 'package:teko_hiring_test/data/remotes/products_remote.dart';
import 'package:teko_hiring_test/domain/entities/component_entity.dart';
import 'package:teko_hiring_test/domain/entities/product_entity.dart';

import '../../domain/repositories/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {

  ProductRepositoryImpl(this.productRemote, this.componentMapper, this.productDao);
  final ProductRemote productRemote;
  final ComponentMapper componentMapper;
  final ProductDao productDao;

  @override
  Future<List<ComponentEntity>> getManagements() async {
    final res = await productRemote.getManagements();
    return componentMapper.mapToListEntity(res.data);
  }

  @override
  Future<List<ProductEntity>> getProducts({required int offset, required int limit}) {
    return productDao.getProductsByOffsetAndLimit(offset, limit);
  }

  @override
  Future<int> insertProduct(ProductEntity product) async {
    final res = await productDao.insertProduct(product);
    return res;
  }


}