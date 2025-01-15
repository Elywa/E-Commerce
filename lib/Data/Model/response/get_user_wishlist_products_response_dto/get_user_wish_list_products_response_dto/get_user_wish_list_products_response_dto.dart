import 'package:e_commerce/Domain/Entities/get_user_wishlist_products_response_entity/get_user_wish_list_products_response_entity/get_user_wish_list_products_response_entity.dart';

import 'wish_list_products_dto.dart';

class GetUserWishListProductsResponseDto
    extends GetUserWishListProductsResponseEntity {
  String? statusMsg;
  String? message;
  GetUserWishListProductsResponseDto(
      {super.status, super.count, super.data, this.message, this.statusMsg});

  factory GetUserWishListProductsResponseDto.fromJson(
      Map<String, dynamic> json) {
    return GetUserWishListProductsResponseDto(
      status: json['status'] as String?,
      message: json['message'] as String?,
      statusMsg: json['statusMsg'] as String?,
      count: json['count'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => WishListProductsDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
