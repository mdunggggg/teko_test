import 'package:intl/intl.dart';
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
}