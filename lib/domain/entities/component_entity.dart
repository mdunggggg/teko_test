enum TypeComponent {
  label,
  productSubmitForm,
  productList,
  button,
}


class ComponentEntity<T> {
  final TypeComponent type;
  T? customAttributes;

  ComponentEntity({
    required this.type,
    this.customAttributes,
  });
}