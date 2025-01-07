import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get_product_entity.dart';

class GetCartResponseEntity {
  String? status;
  int? numOfCartItems;

  GetDataCartEntity? data;

  GetCartResponseEntity({this.status, this.numOfCartItems, this.data});
}
