import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart,
            color: AppColors.primaryColor,
            size: 30,
          ),
        ),
      ],
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back,
          color: AppColors.primaryColor,
          size: 25,
        ),
      ),
      centerTitle: true,
      title: Text(
        'Product Details',
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: AppColors.primaryColor,
              fontSize: 20,
            ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
