import 'add_product_entity.dart';

class AddCartEntity {
  String? id;
  String? cartOwner;
  List<AddProductEntity>? product;

  int? v;
  int? totalCartPrice;

  AddCartEntity({
    this.id,
    this.cartOwner,
    this.product,
    this.v,
    this.totalCartPrice,
  });
}
