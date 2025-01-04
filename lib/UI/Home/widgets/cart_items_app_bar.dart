import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';

AppBar buildCartItemsViewAppBar(BuildContext context) {
  return AppBar(
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.search,
          size: 24,
          color: AppColors.primaryColor,
        ),
      ),
    ],
    leading: IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back,
        size: 25,
        color: AppColors.primaryColor,
      ),
    ),
    centerTitle: true,
    title: Text(
      "Cart",
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(color: AppColors.primaryColor),
    ),
  );
}
