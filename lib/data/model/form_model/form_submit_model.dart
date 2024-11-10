import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teko_hiring_test/data/model/form_model/form_model.dart';

part 'form_submit_model.freezed.dart';
part 'form_submit_model.g.dart';

@freezed
class FormSubmitModel with _$FormSubmitModel {
  const FormSubmitModel._();

  const factory FormSubmitModel({
    @Default([])
    List<FormModel> form,
  }) = _FormSubmitModel;

  factory FormSubmitModel.fromJson(Map<String, dynamic> json) => _$FormSubmitModelFromJson(json);
}
