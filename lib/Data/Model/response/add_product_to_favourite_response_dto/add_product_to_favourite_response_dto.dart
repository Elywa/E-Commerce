import 'package:e_commerce/Domain/Entities/add_product_to_favourite_response_entity/add_product_to_favourite_response_entity.dart';

class AddProductToFavouriteResponseDto
    extends AddProductToFavouriteResponseEntity {
  String? statusMsg;
  AddProductToFavouriteResponseDto(
      {super.status, super.message, super.data, this.statusMsg});

  factory AddProductToFavouriteResponseDto.fromJson(Map<String, dynamic> json) {
    return AddProductToFavouriteResponseDto(
      status: json['status'] as String?,
      statusMsg: json['statusMsg'] as String?,
      message: json['message'] as String?,
      data: json['data'] as List<String>?,
    );
  }
}
