import 'dart:convert';

import 'package:e_commerce/Data/Model/response/category_or_brands_response_dto/category_or_brands_dto.dart';
import 'package:e_commerce/Domain/Entities/products_response_entity/product_entity.dart';
import 'package:flutter/foundation.dart';

@immutable
class ProductDto extends ProductEntity {
  const ProductDto({
    super.sold,
    super.images,
    super.ratingsQuantity,
    super.id,
    super.title,
    super.slug,
    super.description,
    super.quantity,
    super.price,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
    super.priceAfterDiscount,
    super.availableColors,
  });

 factory ProductDto.fromMap(Map<String, dynamic> data) => ProductDto(
  sold: data['sold'] as int?,
  images: (data['images'] as List<dynamic>?)?.cast<String>(),
  
  ratingsQuantity: data['ratingsQuantity'] as int?,
  id: data['_id'] as String?,
  title: data['title'] as String?,
  slug: data['slug'] as String?,
  description: data['description'] as String?,
  quantity: data['quantity'] as int?,
  price: data['price'] as int?,
  imageCover: data['imageCover'] as String?,
  category: data['category'] == null
      ? null
      : CategoryOrBrandsDto.fromJson(
          data['category'] as Map<String, dynamic>),
  brand: data['brand'] == null
      ? null
      : CategoryOrBrandsDto.fromJson(
          data['brand'] as Map<String, dynamic>),
  ratingsAverage: (data['ratingsAverage'] as num?)?.toDouble(),
  priceAfterDiscount: data['priceAfterDiscount'] as int?,
  availableColors: data['availableColors'] as List<dynamic>?,
);


 
}
