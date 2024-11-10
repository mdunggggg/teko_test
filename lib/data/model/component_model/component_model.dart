import 'package:freezed_annotation/freezed_annotation.dart';

part 'component_model.freezed.dart';
part 'component_model.g.dart';



@Freezed(genericArgumentFactories: true)
class ComponentModel<T> with _$ComponentModel {
  const ComponentModel._();

  const factory ComponentModel({
    required String type,
    T? customAttributes,
  }) = _ComponentModel;

  factory ComponentModel.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) => _$ComponentModelFromJson<T>(json, fromJsonT);
}
