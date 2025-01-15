import 'package:e_commerce/Domain/Entities/remove_favourite_product_response_entity/remove_favourite_product_response_entity.dart';

class RemoveFavouriteProductResponseDto
    extends RemoveFavouriteProductResponseEntity {
  String? statusMsg;

  RemoveFavouriteProductResponseDto(
      {super.status, super.message, super.data, this.statusMsg});

  factory RemoveFavouriteProductResponseDto.fromJson(
      Map<String, dynamic> json) {
    return RemoveFavouriteProductResponseDto(
      status: json['status'] as String?,
      statusMsg: json['statusMsg'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)?.map((e) => e.toString()).toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data,
      };
}
