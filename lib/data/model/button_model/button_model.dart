import 'package:freezed_annotation/freezed_annotation.dart';

part 'button_model.freezed.dart';
part 'button_model.g.dart';

@freezed
class ButtonModel with _$ButtonModel {
  const ButtonModel._();

  const factory ButtonModel({
    String? text,
  }) = _ButtonModel;

  factory ButtonModel.fromJson(Map<String, dynamic> json) => _$ButtonModelFromJson(json);
}
