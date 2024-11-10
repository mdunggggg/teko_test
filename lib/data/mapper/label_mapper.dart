import 'package:teko_hiring_test/data/mapper/base_mapper.dart';
import 'package:teko_hiring_test/domain/entities/label_entity.dart';
import 'package:teko_hiring_test/shared/extension/ext_string.dart';

import '../model/label_model/label_model.dart';

class LabelMapper extends BaseDataMapper<LabelModel, LabelEntity> {

    @override
    LabelEntity mapToEntity(LabelModel? data) {
      return LabelEntity(
        text: (data?.text).validator,
      );
    }
}