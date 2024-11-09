
import '../../domain/entities/component_entity.dart';

extension extString on String? {
  double? get convertDouble => double.tryParse(toString());
  int? get convertInt => int.tryParse(toString());

  String get validator => this ?? '';

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