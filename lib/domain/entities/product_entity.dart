import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';
part 'product_entity.g.dart';

@entity // for local database using floor
@JsonSerializable()
class ProductEntity {
  @PrimaryKey(autoGenerate: true)
  final int? id;
  final String name;
  final int price;
  final String imageSrc;

  factory ProductEntity.fromJson(Map<String, dynamic> json) => _$ProductEntityFromJson(json);
  Map<String, dynamic> toJson() => _$ProductEntityToJson(this);

  ProductEntity({
    this.id,
    required this.name,
    required this.price,
    required this.imageSrc,
  });

}