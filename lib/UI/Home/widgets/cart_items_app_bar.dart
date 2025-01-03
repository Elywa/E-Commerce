import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';

class CartItemsAppBar extends StatelessWidget {
  const CartItemsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 20,
            color: AppColors.primaryColor,
          ),
        ),
        Text(
          "Cart",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.primaryColor),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            size: 24,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
