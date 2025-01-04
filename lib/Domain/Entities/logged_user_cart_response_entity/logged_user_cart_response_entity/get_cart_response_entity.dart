import 'get_data_cart_entity.dart';

class GetCartResponseEntity {
  String? status;
  int? numOfCartItems;
  String? cartId;
  GetDataCartEntity? data;

  GetCartResponseEntity({
    this.status,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}
