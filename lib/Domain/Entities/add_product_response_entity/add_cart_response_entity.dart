import 'add_cart_entity.dart';

class AddCartResponseEntity {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  AddCartEntity? data;

  AddCartResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,
  });
}
