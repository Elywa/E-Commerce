import 'dart:convert';

import 'package:e_commerce/Domain/Entities/add_product_response_entity/add_cart_entity.dart';

import 'add_product_dto.dart';

class AddCartDto extends AddCartEntity {
  AddCartDto({
    super.id,
    super.cartOwner,
    super.product,
    super.v,
    super.totalCartPrice,
  });

  factory AddCartDto.fromJson(Map<String, dynamic> data) => AddCartDto(
        id: data['_id'] as String?,
        cartOwner: data['cartOwner'] as String?,
        product: (data['products'] as List<dynamic>?)
            ?.map((e) => AddProductDto.fromJson(e as Map<String, dynamic>))
            .toList(),
        v: data['__v'] as int?,
        totalCartPrice: data['totalCartPrice'] as int?,
      );
}
