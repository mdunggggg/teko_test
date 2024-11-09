import 'package:teko_hiring_test/data/mapper/base_mapper.dart';
import 'package:teko_hiring_test/data/model/form_model.dart';
import 'package:teko_hiring_test/domain/entities/form_entity.dart';
import 'package:teko_hiring_test/shared/extension/ext_string.dart';

class FormMapper extends BaseDataMapper<FormModel, FormEntity> {
  @override
  FormEntity mapToEntity(FormModel? data) {
    return FormEntity(
      label: (data?.label).validator,
      isRequired: data?.required ?? false,
      name: (data?.name).validator,
      type: (data?.type).validator,
      maxLength: data?.maxLength ?? 0,
      minLength: data?.minLength ?? 0,
    );
  }

}