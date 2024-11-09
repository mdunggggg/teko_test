class FormEntity {
  final String label;
  final bool isRequired;
  final String name;
  final String type;
  final int maxLength;
  final int minLength;

  FormEntity({
    required this.label,
    required this.isRequired,
    required this.name,
    required this.type,
    required this.maxLength,
    required this.minLength,
  });
}