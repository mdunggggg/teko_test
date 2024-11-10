import 'package:intl/intl.dart';
import 'package:teko_hiring_test/domain/entities/form_entity.dart';
import '../../domain/entities/component_entity.dart';

extension extString on String? {
  double? get convertDouble => double.tryParse(toString());
  int? get convertInt => int.tryParse(toString());

  String get validator => this ?? '';
  bool get isEmptyOrNull => this == null || this == 'null' || this!.isEmpty;
  String get formatCurrency {
    final oCcy = NumberFormat('#,##0', 'vi_VN');
    return oCcy.format(this ?? 0);
  }
  TypeComponent get convertType {
    switch (this) {
      case 'Label':
        return TypeComponent.label;
      case 'ProductSubmitForm':
        return TypeComponent.productSubmitForm;
      case 'ProductList':
        return TypeComponent.productList;
      case 'Button':
        return TypeComponent.button;
      default:
        throw Exception('Type not found $this');
    }
  }

  FormType get convertFormType {
    switch (this) {
      case 'text':
        return FormType.text;
      case 'number':
        return FormType.number;
      case 'file_upload':
        return FormType.file_upload;
      default:
        return FormType.text;
    }
  }

  int removeAllDot() {
    if(this == null) return 0;
    return int.parse(this!.replaceAll('.', ''));
  }
}