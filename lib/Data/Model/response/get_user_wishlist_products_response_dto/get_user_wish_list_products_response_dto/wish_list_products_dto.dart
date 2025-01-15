import 'package:e_commerce/Data/Model/response/category_or_brands_response_dto/category_or_brands_dto.dart';
import 'package:e_commerce/Domain/Entities/get_user_wishlist_products_response_entity/get_user_wish_list_products_response_entity/wish_list_product_entity.dart';

class WishListProductsDto extends WishListProductEntity {
  WishListProductsDto({
    super.sold,
    super.images,
    super.subcategory,
    super.ratingsQuantity,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.id,
  });

  factory WishListProductsDto.fromJson(Map<String, dynamic> json) =>
      WishListProductsDto(
        sold: json['sold'] as int?,
        images: (json['images'] as List<dynamic>?)
            ?.map((image) => image.toString())
            .toList(),
        subcategory: (json['subcategory'] as List<dynamic>?)
            ?.map(
                (e) => CategoryOrBrandsDto.fromJson(e as Map<String, dynamic>))
            .toList(),
        ratingsQuantity: json['ratingsQuantity'] as int?,
        title: json['title'] as String?,
        slug: json['slug'] as String?,
        description: json['description'] as String?,
        quantity: json['quantity'] as int?,
        price: json['price'] as int?,
        imageCover: json['imageCover'] as String?,
        category: json['category'] == null
            ? null
            : CategoryOrBrandsDto.fromJson(
                json['category'] as Map<String, dynamic>),
        brand: json['brand'] == null
            ? null
            : CategoryOrBrandsDto.fromJson(
                json['brand'] as Map<String, dynamic>),
        ratingsAverage: (json['ratingsAverage'] as num?)?.toDouble(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        id: json['id'] as String?,
      );
}
