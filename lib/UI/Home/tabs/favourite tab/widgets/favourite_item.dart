import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get_product_cart_entity.dart';

import 'package:e_commerce/UI/Home/widgets/cart_item_details.dart';
import 'package:e_commerce/UI/Home/widgets/cart_item_image.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:flutter/material.dart';

class FavouriteItemView extends StatelessWidget {
  const FavouriteItemView({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      child: Container(
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * .16,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 206, 226, 226).withOpacity(0.8),
              spreadRadius: 1,

              offset: const Offset(3, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey, width: 1),
        ),
        child: Row(
          children: [
            CartItemImage(
              image: MyAssets.networkImage,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nike Air Jordan",
                          overflow: TextOverflow.clip,
                          maxLines: 1,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: const Color(0xff06004F),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                        ),
                        const CircleAvatar(
                          backgroundColor: AppColors.whiteColor,
                          radius: 15,
                          child: Image(
                            image: AssetImage(MyAssets.favouriteImageIcon),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: AppColors.darkBrownColor,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        "Black Color",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: const Color(0xff06004F),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Text(
                        "EGP 100",
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: const Color(0xff06004F),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '2000 EGP',
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                      ),
                      const SizedBox(width: 9),
                      Container(
                        width: MediaQuery.sizeOf(context).width * .25,
                        height: MediaQuery.sizeOf(context).width * .08,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: AppColors.primaryColor),
                        child: Center(
                          child: Text(
                            "Add to Cart",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 14),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
