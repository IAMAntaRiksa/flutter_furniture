import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'price')
  final double price;
  @JsonKey(name: 'description')
  final String? deskripsi;
  @JsonKey(name: 'category')
  final String? category;
  @JsonKey(name: 'image')
  final String? image;
  @JsonKey(name: 'rating')
  final Rating rating;
  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.deskripsi,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory Product.formJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Rating {
  @JsonKey(name: 'rate')
  final double rate;
  @JsonKey(name: 'count')
  final int count;
  Rating({
    required this.rate,
    required this.count,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);

  Map<String, dynamic> toJson() => _$RatingToJson(this);
}
