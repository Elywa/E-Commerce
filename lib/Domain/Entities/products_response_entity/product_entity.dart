import 'dart:convert';

import 'package:e_commerce/Domain/Entities/category_or_brands_response_entity/category_or_brands_entity.dart';
import 'package:flutter/foundation.dart';

@immutable
class ProductEntity {
  final int? sold;
  final List<String>? images;
  final int? ratingsQuantity;
  final String? id;
  final String? title;
  final String? slug;
  final String? description;
  final int? quantity;
  final int? price;
  final String? imageCover;
  final CategoryOrBrandsEntity? category;
  final CategoryOrBrandsEntity? brand;
  final double? ratingsAverage;

  final int? priceAfterDiscount;
  final List<dynamic>? availableColors;

  const ProductEntity({
    this.sold,
    this.images,
    this.ratingsQuantity,
    this.id,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.priceAfterDiscount,
    this.availableColors,
  });
}
