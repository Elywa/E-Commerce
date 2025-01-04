import 'package:e_commerce/Domain/Entities/products_response_entity/get_product_entity.dart';

import 'get_product_cart_entity.dart';

class GetProductCartEntity {
  int? count;
  String? id;
  GetProductEntity? product;
  int? price;

  GetProductCartEntity({this.count, this.id, this.product, this.price});
}
