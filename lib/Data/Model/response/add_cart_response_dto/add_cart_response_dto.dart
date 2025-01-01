import 'dart:convert';

import 'package:e_commerce/Domain/Entities/add_product_response_entity/add_cart_response_entity.dart';

import 'add_cart_dto.dart';

class AddCartResponseDto extends AddCartResponseEntity {
  String? statusMsg;
  AddCartResponseDto(
      {super.status,
      super.message,
      super.numOfCartItems,
      super.cartId,
      super.data,
      this.statusMsg});

  factory AddCartResponseDto.fromJson(Map<String, dynamic> data) {
    return AddCartResponseDto(
      status: data['status'] as String?,
      statusMsg: data['statusMsg'] as String?,
      message: data['message'] as String?,
      numOfCartItems: data['numOfCartItems'] as int?,
      cartId: data['cartId'] as String?,
      data: data['data'] == null
          ? null
          : AddCartDto.fromJson(data['data'] as Map<String, dynamic>),
    );
  }
}
