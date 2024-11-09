import 'package:teko_hiring_test/data/mapper/base_mapper.dart';
import 'package:teko_hiring_test/data/model/button_model.dart';
import 'package:teko_hiring_test/domain/entities/button_entity.dart';
import 'package:teko_hiring_test/shared/extension/ext_string.dart';

class ButtonMapper extends BaseDataMapper<ButtonModel, ButtonEntity> {
  @override
  ButtonEntity mapToEntity(ButtonModel? data) {
    return ButtonEntity(
      text: (data?.text).validator,
    );
  }

}