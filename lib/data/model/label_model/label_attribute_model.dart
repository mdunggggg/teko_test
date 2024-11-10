import 'package:freezed_annotation/freezed_annotation.dart';

import 'label_model.dart';

part 'label_attribute_model.freezed.dart';
part 'label_attribute_model.g.dart';

@freezed
class LabelAttributeModel with _$LabelAttributeModel {
  const LabelAttributeModel._();

  const factory LabelAttributeModel({
    LabelModel? label,
  }) = _LabelAttributeModel;

  factory LabelAttributeModel.fromJson(Map<String, dynamic> json) => _$LabelAttributeModelFromJson(json);
}
