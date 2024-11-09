import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teko_hiring_test/data/model/product_list_model.dart';

part 'product_list_attribute_model.freezed.dart';
part 'product_list_attribute_model.g.dart';

@freezed
class ProductListAttributeModel with _$ProductListAttributeModel {
  const ProductListAttributeModel._();

  const factory ProductListAttributeModel({
    ProductListModel? productList,
  }) = _ProductListAttributeModel;

  factory ProductListAttributeModel.fromJson(Map<String, dynamic> json) => _$ProductListAttributeModelFromJson(json);
}
