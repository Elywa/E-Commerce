import 'package:e_commerce/Domain/Entities/products_response_entity/get_product_entity.dart';
import 'package:e_commerce/UI/Home/widgets/product_details_view_appbar.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});
  static const String routeName = 'Product Details View';

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments as GetProductEntity;
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width *
                        0.9, // Adjust width to be responsive
                    height: MediaQuery.of(context).size.width *
                        0.6, // Maintain aspect ratio
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border:
                          Border.all(color: AppColors.primaryColor, width: 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ImageSlideshow(
                        isLoop: true,
                        initialPage: 0,
                        indicatorColor: AppColors.primaryColor,
                        indicatorBackgroundColor: Colors.grey,
                        autoPlayInterval: 5000,
                        indicatorBottomPadding: 5.h,
                        indicatorRadius: 5,
                        children: args.images!
                            .map(
                              (url) => Image.network(
                                url,
                                fit: BoxFit
                                    .cover, // Ensures image fills the container
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 16,
                    top: 16,
                    child: InkWell(
                      onTap: () {},
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.whiteColor,
                        child: Image.asset(
                          MyAssets.favouriteImageIcon,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      args.title ?? "Unknown",
                      maxLines: 3,
                      textAlign: TextAlign.start,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'EGP ${args.price}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Container(
                    width: 120.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                          color: const Color.fromARGB(255, 157, 186, 209),
                          width: 1),
                    ),
                    child: Center(
                      child: Text(
                        '${args.sold} Sold',
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Image.asset(MyAssets.starIconImage),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    '${args.ratingsAverage} (${args.ratingsQuantity})',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  Container(
                    width: 120.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.primaryColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          child: Image.asset(MyAssets.circleSubtractIconImage),
                        ),
                        const Text(
                          '1',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        InkWell(
                          child: Image.asset(MyAssets.circlePlusIconImage),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Desciption',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10), // Adjust padding as needed
                child: ReadMoreText(
                  args.description ?? "Unknown",
                  trimMode: TrimMode.Line,
                  trimLines: 2,
                  colorClickableText: AppColors.primaryColor,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  style: const TextStyle(
                      fontSize: 14), // Ensure consistent font size
                  moreStyle: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Size',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '38',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '39',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '40',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '41',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '42',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '43',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '44',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                  Text(
                    '45',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Color',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 5,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.black,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.red,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.yellow,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.blue,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.pink,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      const Text(
                        'Total Price',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      Text(
                        'EGP ${args.price}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 37.w,
                  ),
                  InkWell(
                    child: Container(
                      width: 250.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Add to cart',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
