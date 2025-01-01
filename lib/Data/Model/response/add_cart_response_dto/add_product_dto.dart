import 'dart:convert';

import 'package:e_commerce/Domain/Entities/add_product_response_entity/add_product_entity.dart';

class AddProductDto extends AddProductEntity {
  AddProductDto({super.count, super.id, super.product, super.price});

  factory AddProductDto.fromJson(Map<String, dynamic> data) => AddProductDto(
        count: data['count'] as int?,
        id: data['_id'] as String?,
        product: data['product'] as String?,
        price: data['price'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'count': count,
        '_id': id,
        'product': product,
        'price': price,
      };
}
