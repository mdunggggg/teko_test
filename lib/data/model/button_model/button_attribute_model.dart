import 'package:freezed_annotation/freezed_annotation.dart';

import 'button_model.dart';

part 'button_attribute_model.freezed.dart';
part 'button_attribute_model.g.dart';

@freezed
class ButtonAttributeModel with _$ButtonAttributeModel {
  const ButtonAttributeModel._();

  const factory ButtonAttributeModel({
    ButtonModel? button,
  }) = _ButtonAttributeModel;

  factory ButtonAttributeModel.fromJson(Map<String, dynamic> json) => _$ButtonAttributeModelFromJson(json);
}
