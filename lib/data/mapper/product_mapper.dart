import 'package:teko_hiring_test/data/mapper/base_mapper.dart';
import 'package:teko_hiring_test/data/model/product_model.dart';
import 'package:teko_hiring_test/domain/entities/product_entity.dart';
import 'package:teko_hiring_test/shared/extension/ext_string.dart';

class ProductMapper extends BaseDataMapper<ProductModel, ProductEntity> {
  @override
  ProductEntity mapToEntity(ProductModel? data) {
    return ProductEntity(
      name: (data?.name).validator,
      price: data?.price ?? 0,
      imageSrc: (data?.imageSrc).validator,
    );
  }
}
