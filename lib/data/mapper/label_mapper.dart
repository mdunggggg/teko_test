import 'package:teko_hiring_test/data/mapper/base_mapper.dart';
import 'package:teko_hiring_test/data/model/label_model.dart';
import 'package:teko_hiring_test/domain/entities/label_entity.dart';
import 'package:teko_hiring_test/shared/extension/ext_string.dart';

class LabelMapper extends BaseDataMapper<LabelModel, LabelEntity> {

    @override
    LabelEntity mapToEntity(LabelModel? data) {
      return LabelEntity(
        text: (data?.text).validator,
      );
    }
}