import 'package:teko_hiring_test/data/mapper/base_mapper.dart';
import 'package:teko_hiring_test/data/mapper/product_mapper.dart';
import 'package:teko_hiring_test/data/model/product_list_model.dart';
import 'package:teko_hiring_test/domain/entities/product_list_entity.dart';

class ProductListMapper extends BaseDataMapper<ProductListModel, ProductListEntity> {

  ProductListMapper(this.productMapper);
  final ProductMapper productMapper;

  @override
  ProductListEntity mapToEntity(ProductListModel? data) {
    return ProductListEntity(
      products: productMapper.mapToListEntity(data?.items ?? []),
    );
  }

}