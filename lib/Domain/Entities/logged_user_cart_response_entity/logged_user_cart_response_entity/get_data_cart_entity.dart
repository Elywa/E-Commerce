import 'get_product_cart_entity.dart';

class GetDataCartEntity {
  String? id;
  String? cartOwner;
  List<GetProductCartEntity>? products;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? totalCartPrice;

  GetDataCartEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });
}
