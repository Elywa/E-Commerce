import 'package:e_commerce/UI/Home/widgets/cart_item_details.dart';
import 'package:e_commerce/UI/Home/widgets/cart_item_image.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';

class CartViewItem extends StatelessWidget {
  const CartViewItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * .18,
      decoration: BoxDecoration(
        color: AppColors.lightBlue,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: const Row(
        children: [
          CartItemImage(),
          SizedBox(
            width: 10,
          ),
          CartItemDetails()
        ],
      ),
    );
  }
}
