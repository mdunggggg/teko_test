import 'package:freezed_annotation/freezed_annotation.dart';

part 'label_model.freezed.dart';
part 'label_model.g.dart';

@freezed
class LabelModel with _$LabelModel {
  const LabelModel._();

  const factory LabelModel({
    required String text,
  }) = _LabelModel;

  factory LabelModel.fromJson(Map<String, dynamic> json) => _$LabelModelFromJson(json);
}
