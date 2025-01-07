import 'package:e_commerce/Data/Model/response/products_response_dto/product_dto.dart';
import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get_product_cart_entity.dart';

import 'get_product_cart_dto.dart';

class GetProductCartDto extends GetProductCartEntity {
  GetProductCartDto({super.count, super.id, super.product, super.price});

  factory GetProductCartDto.fromJson(Map<String, dynamic> json) =>
      GetProductCartDto(
        count: json['count'] as int?,
        id: json['_id'] as String?,
        product: json['product'] == null
            ? null
            : ProductDto.fromMap(json['product'] as Map<String, dynamic>),
        price: json['price'] as int?,
      );
}
