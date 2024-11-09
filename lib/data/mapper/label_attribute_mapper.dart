import 'package:teko_hiring_test/data/mapper/base_mapper.dart';
import 'package:teko_hiring_test/data/mapper/label_mapper.dart';
import 'package:teko_hiring_test/data/model/label_attribute_model.dart';
import 'package:teko_hiring_test/domain/entities/label_attribute_entity.dart';

class LabelAttributeMapper extends BaseDataMapper<LabelAttributeModel, LabelAttributeEntity> {

  LabelAttributeMapper(this.labelMapper);
  final LabelMapper labelMapper;

  @override
  LabelAttributeEntity mapToEntity(LabelAttributeModel? data) {
    return LabelAttributeEntity(
      label: labelMapper.mapToEntity(data?.label),
    );
  }
}