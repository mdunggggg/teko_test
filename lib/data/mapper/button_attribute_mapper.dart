import 'package:teko_hiring_test/data/mapper/base_mapper.dart';
import 'package:teko_hiring_test/data/mapper/button_mapper.dart';
import 'package:teko_hiring_test/data/model/button_attribute_model.dart';
import 'package:teko_hiring_test/domain/entities/button_attribute_entity.dart';

class ButtonAttributeMapper extends BaseDataMapper<ButtonAttributeModel, ButtonAttributeEntity> {

  ButtonAttributeMapper(this.buttonMapper);
  final ButtonMapper buttonMapper;

  @override
  ButtonAttributeEntity mapToEntity(ButtonAttributeModel? data) {
    return ButtonAttributeEntity(
      button: buttonMapper.mapToEntity(data?.button),
    );
  }

}