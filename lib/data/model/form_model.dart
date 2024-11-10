import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_model.freezed.dart';
part 'form_model.g.dart';

@freezed
class FormModel with _$FormModel {
  const FormModel._();

  const factory FormModel({
    String? label,
    bool? required,
    String? name,
    String? type,
    int? maxLength,
    int? minValue,
    int? maxValue,
  }) = _FormModel;

  factory FormModel.fromJson(Map<String, dynamic> json) => _$FormModelFromJson(json);
}
