import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get_dart_cart_entity.dart';

class GetCartResponseEntity {
  String? status;
  int? numOfCartItems;

  GetDataCartEntity? data;

  GetCartResponseEntity({this.status, this.numOfCartItems, this.data});
}
