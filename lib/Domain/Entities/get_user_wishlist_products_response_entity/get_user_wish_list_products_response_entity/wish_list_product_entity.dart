import 'package:e_commerce/Data/Model/response/category_or_brands_response_dto/category_or_brands_dto.dart';
import 'package:e_commerce/Domain/Entities/category_or_brands_response_entity/category_or_brands_entity.dart';

class WishListProductEntity {
  int? sold;
  List<String>? images;
  List<CategoryOrBrandsEntity>? subcategory;
  int? ratingsQuantity;

  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryOrBrandsEntity? category;
  CategoryOrBrandsEntity? brand;
  double? ratingsAverage;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? id;

  WishListProductEntity({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.id,
  });
}
