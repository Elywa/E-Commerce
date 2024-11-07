import 'dart:convert';

import 'package:e_commerce/Domain/Entities/add_product_response_entity/add_product_response_entity.dart';

import 'data_dto.dart';

class AddProductResponseDto extends AddProductResponseEntity {
  String? statusMsg;
  AddProductResponseDto(
      {super.status,
      super.message,
      super.numOfCartItems,
      super.cartId,
      super.data,
      this.statusMsg});

  factory AddProductResponseDto.fromJson(Map<String, dynamic> data) {
    return AddProductResponseDto(
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
