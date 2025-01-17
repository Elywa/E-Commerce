import 'package:e_commerce/Domain/Entities/get_cart_response_entity/get/get_product_cart_entity.dart';
import 'package:e_commerce/UI/Home/tabs/cart/cubit/cubit/cart_products_cubit.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';

class CartItemDetails extends StatelessWidget {
  const CartItemDetails({
    super.key,
    required this.product,
  });
  final GetProductCartEntity product;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.product!.title!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: AppColors.primaryColor),
                ),
              ),
              IconButton(
                onPressed: () {
                  CartProductsCubit.get(context)
                      .deleteCartProduct(product.product!.id ?? '');
                },
                icon: const Icon(
                  Icons.delete,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Count: ${product.count}",
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(color: AppColors.primaryColor),
          ),
          const SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 4, bottom: 4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${product.price} EGP',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width * .4,
                  height: MediaQuery.sizeOf(context).height * .05,
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          int counter = product.count!.toInt();
                          counter--;
                          print(
                              "------------- counter ( - ) is $counter ---------- ");
                          CartProductsCubit.get(context)
                              .updateCartProduct(product.product!.id!, counter);
                        },
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        ' ${product.count}',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                      IconButton(
                        onPressed: () {
                          int counter = product.count!.toInt();
                          counter++;
                          print(
                              "------------- counter ( + ) is $counter ---------- ");
                          CartProductsCubit.get(context)
                              .updateCartProduct(product.product!.id!, counter);
                        },
                        icon: const Icon(
                          Icons.add_circle_outline,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
