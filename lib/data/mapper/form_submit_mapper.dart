import 'package:teko_hiring_test/data/mapper/base_mapper.dart';
import 'package:teko_hiring_test/data/mapper/form_mapper.dart';

import '../../domain/entities/form_submit_entity.dart';
import '../model/form_model/form_submit_model.dart';

class FormSubmitMapper
    extends BaseDataMapper<FormSubmitModel, FormSubmitEntity> {
  FormSubmitMapper(this.formMapper);

  final FormMapper formMapper;

  @override
  FormSubmitEntity mapToEntity(FormSubmitModel? data) {
    return FormSubmitEntity(
        forms: formMapper.mapToListEntity(data?.form ?? []));
  }
}
