import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get_dart_cart_entity.dart';

import 'get_product_cart_dto.dart';

class GetDataCartDto extends GetDataCartEntity {
  GetDataCartDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  factory GetDataCartDto.fromJson(Map<String, dynamic> json) => GetDataCartDto(
        id: json['_id'] as String?,
        cartOwner: json['cartOwner'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => GetProductCartDto.fromJson(e as Map<String, dynamic>))
            .toList(),
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
        totalCartPrice: json['totalCartPrice'] as int?,
      );
}
