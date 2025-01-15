import 'wish_list_product_entity.dart';

class GetUserWishListProductsResponseEntity {
  String? status;
  int? count;
  List<WishListProductEntity>? data;

  GetUserWishListProductsResponseEntity({
    this.status,
    this.count,
    this.data,
  });
}
