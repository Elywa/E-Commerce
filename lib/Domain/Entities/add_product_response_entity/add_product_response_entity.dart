import 'data_entity.dart';

class AddProductResponseEntity {
  String? status;
  String? message;
  int? numOfCartItems;
  String? cartId;
  AddCartDataEntity? data;
  
  AddProductResponseEntity({
    this.status,
    this.message,
    this.numOfCartItems,
    this.cartId,
    this.data,

  });
}
