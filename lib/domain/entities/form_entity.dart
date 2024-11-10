enum FormType {
  text,
  number,
  file_upload,
}

class FormEntity {
  final String label;
  final bool isRequired;
  final String name;
  final FormType type;
  final int maxValue;
  final int minValue;
  final int maxLength;

  FormEntity({
    required this.label,
    required this.isRequired,
    required this.name,
    required this.type,
    required this.maxLength,
    required this.maxValue,
    required this.minValue,
  });
}
