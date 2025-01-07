import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get.cart.response.entity.dart';

import 'get_data_cart_dto.dart';

class GetCartResponseDto extends GetCartResponseEntity {
  String? statusMessage;
  GetCartResponseDto({
    super.status,
    super.numOfCartItems,
    this.statusMessage,
    super.data,
  });

  factory GetCartResponseDto.fromJson(Map<String, dynamic> json) {
    return GetCartResponseDto(
      status: json['status'] as String?,
      numOfCartItems: json['numOfCartItems'] as int?,
      statusMessage: json['statusMsg'] as String?,
      data: json['data'] == null
          ? null
          : GetDataCartDto.fromJson(json['data'] as Map<String, dynamic>),
    );
  }
}
