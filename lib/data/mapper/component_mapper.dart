import 'package:teko_hiring_test/data/mapper/base_mapper.dart';
import 'package:teko_hiring_test/data/mapper/button_attribute_mapper.dart';
import 'package:teko_hiring_test/data/mapper/form_submit_mapper.dart';
import 'package:teko_hiring_test/data/mapper/label_attribute_mapper.dart';
import 'package:teko_hiring_test/data/mapper/product_list_attribute_mapper.dart';
import 'package:teko_hiring_test/data/model/base/component_model.dart';
import 'package:teko_hiring_test/domain/entities/button_attribute_entity.dart';
import 'package:teko_hiring_test/domain/entities/component_entity.dart';
import 'package:teko_hiring_test/domain/entities/label_entity.dart';
import 'package:teko_hiring_test/shared/extension/ext_string.dart';

import '../../domain/entities/form_submit_entity.dart';
import '../../domain/entities/label_attribute_entity.dart';
import '../../domain/entities/product_list_attribute_entity.dart';
import '../model/button_attribute_model.dart';
import '../model/form_submit_model.dart';
import '../model/label_attribute_model.dart';
import '../model/product_list_attribute_model.dart';

class ComponentMapper extends BaseDataMapper<ComponentModel, ComponentEntity> {
  ComponentMapper(
    this.buttonAttributeMapper,
    this.labelAttributeMapper,
    this.formSubmitMapper,
    this.productListAttributeMapper,
  );

  final ButtonAttributeMapper buttonAttributeMapper;
  final FormSubmitMapper formSubmitMapper;
  final LabelAttributeMapper labelAttributeMapper;
  final ProductListAttributeMapper productListAttributeMapper;

  @override
  ComponentEntity mapToEntity(ComponentModel<dynamic>? data) {
    final TypeComponent type = data?.type.convertType ?? TypeComponent.button;
    switch (type) {
      case TypeComponent.button:
        return ComponentEntity<ButtonAttributeEntity>(
          type: type,
          customAttributes:
              buttonAttributeMapper.mapToEntity(ButtonAttributeModel.fromJson(data?.customAttributes)),
        );
      case TypeComponent.label:
        return ComponentEntity<LabelAttributeEntity>(
          type: type,
          customAttributes:
              labelAttributeMapper.mapToEntity(LabelAttributeModel.fromJson(data?.customAttributes)),
        );
      case TypeComponent.productSubmitForm:
        return ComponentEntity<FormSubmitEntity>(
          type: type,
          customAttributes:
              formSubmitMapper.mapToEntity(FormSubmitModel.fromJson(data?.customAttributes)),
        );
      case TypeComponent.productList:
        return ComponentEntity<ProductListAttributeEntity>(
          type: type,
          customAttributes:
              productListAttributeMapper.mapToEntity(ProductListAttributeModel.fromJson(data?.customAttributes)),
        );
    }
  }
}
