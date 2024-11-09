import 'package:freezed_annotation/freezed_annotation.dart';

part 'base_model.freezed.dart';
part 'base_model.g.dart';

@Freezed(genericArgumentFactories: true)
class BaseModel<T> with _$BaseModel {
  const BaseModel._();

  const factory BaseModel({
    required String code,
    required String message,
    T? data,
  }) = _BaseModel<T>;

  factory BaseModel.fromJson(Map<String, dynamic> json, T Function(Object?) fromJsonT) => _$BaseModelFromJson<T>(json, fromJsonT);
}
