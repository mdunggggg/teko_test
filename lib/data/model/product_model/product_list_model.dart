import 'package:freezed_annotation/freezed_annotation.dart';

import 'product_model.dart';

part 'product_list_model.freezed.dart';
part 'product_list_model.g.dart';

@freezed
class ProductListModel with _$ProductListModel {
  const ProductListModel._();

  const factory ProductListModel({
    @Default(<ProductModel>[])
    List<ProductModel>? items,
  }) = _ProductListModel;

  factory ProductListModel.fromJson(Map<String, dynamic> json) => _$ProductListModelFromJson(json);
}
