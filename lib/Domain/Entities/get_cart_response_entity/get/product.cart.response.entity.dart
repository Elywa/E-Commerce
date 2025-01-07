import 'package:e_commerce/Domain/Entities/products_response_entity/get_product_entity.dart';

import 'product.cart.response.entity.dart';

class GetProductCartEntity {
  int? count;
  String? id;
  GetProductCartEntity? product;
  int? price;

  GetProductCartEntity({this.count, this.id, this.product, this.price});
}
