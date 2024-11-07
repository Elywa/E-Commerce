import 'dart:convert';

import 'package:e_commerce/Domain/Entities/add_product_response_entity/data_entity.dart';

import 'product_dto.dart';

class AddCartDto extends AddCartDataEntity {
  AddCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.v,
    super.totalCartPrice,
  });

  factory AddCartDto.fromJson(Map<String, dynamic> data) => AddCartDto(
        id: data['_id'] as String?,
        cartOwner: data['cartOwner'] as String?,
        products: (data['products'] as List<dynamic>?)
            ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
            .toList(),
        v: data['__v'] as int?,
        totalCartPrice: data['totalCartPrice'] as int?,
      );

}
