import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get_product_cart_entity.dart';
import 'package:e_commerce/UI/Home/widgets/cart_item_details.dart';
import 'package:e_commerce/UI/Home/widgets/cart_item_image.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';

class CartViewItem extends StatelessWidget {
  const CartViewItem({
    super.key,
    required this.product,
  });
  final GetProductCartEntity product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * .18,
        decoration: BoxDecoration(
          color: AppColors.lightBlue,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Row(
          children: [
            CartItemImage(
              image: product.product?.imageCover,
            ),
            const SizedBox(
              width: 10,
            ),
            CartItemDetails(
              product: product,
            )
          ],
        ),
      ),
    );
  }
}
