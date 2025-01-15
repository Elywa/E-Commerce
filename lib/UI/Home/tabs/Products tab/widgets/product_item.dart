import 'package:e_commerce/Data/Model/response/add_cart_response_dto/add_cart_response_dto.dart';
import 'package:e_commerce/Domain/Entities/add_product_response_entity/add_cart_response_entity.dart';
import 'package:e_commerce/UI/Home/product_details_view.dart';
import 'package:e_commerce/UI/Home/tabs/Products%20tab/cubits/cubit/products_tab_view_model_cubit.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem(
      {super.key,
      this.imagePath,
      this.title,
      this.description,
      this.price,
      this.rate,
      this.id});
  final String? imagePath;
  final String? title;
  final String? description;
  final int? price;
  final double? rate;
  final String? id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        // width: MediaQuery.of(context).size.width * .43,
        // height: MediaQuery.of(context).size.width * .6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 1.5,
            color: AppColors.primaryColor,
          ),
        ),
        child: Column(
          children: [
            // Top half with the image and favorite icon
            Expanded(
              flex: 2,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                      child: Image.network(
                        imagePath ??
                            'https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                    Positioned(
                      right: 6,
                      top: 7,
                      child: InkWell(
                        onTap: () {
                          ProductsTabViewModelCubit.get(context)
                              .addProductToFavourite(id ?? '');
                          
                        },
                        child:const CircleAvatar(
                          backgroundColor: AppColors.whiteColor,
                          radius: 15,
                          child: Image(
                            image: AssetImage(MyAssets.favouriteImageIcon),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom half with product details
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? 'Unknown',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                      maxLines: 1,
                    ),
                    Text(
                      description ?? 'Unknown',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.grey,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          '$price',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                  ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          '2000 EGP',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: Colors.grey,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Text(
                          'Review/ $rate',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: Colors.grey),
                        ),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 14,
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            ProductsTabViewModelCubit.get(context)
                                .addProductToCart(productId: id ?? "");
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.whiteColor,
                            child: Image.asset(
                              MyAssets.addImageIcon,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
