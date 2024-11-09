import 'package:teko_hiring_test/data/mapper/base_mapper.dart';
import 'package:teko_hiring_test/data/mapper/product_list_mapper.dart';
import 'package:teko_hiring_test/data/model/product_list_attribute_model.dart';
import 'package:teko_hiring_test/domain/entities/product_list_attribute_entity.dart';

class ProductListAttributeMapper extends BaseDataMapper<ProductListAttributeModel, ProductListAttributeEntity> {

  ProductListAttributeMapper(this.productListMapper);
  final ProductListMapper productListMapper;

  @override
  ProductListAttributeEntity mapToEntity(ProductListAttributeModel? data) {
    return ProductListAttributeEntity(
      productList: productListMapper.mapToEntity(data?.productList),
    );
  }
}
