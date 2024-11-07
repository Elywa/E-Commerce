import 'add_product_entity.dart';

class AddCartDataEntity {
  String? id;
  String? cartOwner;
  List<AddProductEntity>? products;

  int? v;
  int? totalCartPrice;

  AddCartDataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.v,
    this.totalCartPrice,
  });
}
