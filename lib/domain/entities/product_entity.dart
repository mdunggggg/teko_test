class ProductEntity {
  final String name;
  final int price;
  final String imageSrc;

  ProductEntity({
    required this.name,
    required this.price,
    required this.imageSrc,
  });

  Map<String, Object> toJson() {
    return {
      'name': name,
      'price': price,
      'imageSrc': imageSrc,
    };
  }
}