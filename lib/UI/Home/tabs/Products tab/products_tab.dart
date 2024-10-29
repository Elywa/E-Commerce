import 'package:e_commerce/UI/Home/tabs/Products%20tab/widgets/product_item.dart';
import 'package:e_commerce/UI/Home/widgets/search_row.dart';
import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTabView extends StatelessWidget {
  const ProductsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 6,
              ),
              const Image(
                image: AssetImage(MyAssets.routeImage),
              ),
              const SizedBox(
                height: 17.5,
              ),
              const SearchRow(),
              SizedBox(
                height: 24.h,
              ),
              GridView.builder(
                itemCount: 20,
                padding: EdgeInsets.zero,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return const ProductItem();
                },
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    // crossAxisSpacing: 16,
                    childAspectRatio: 2.3 / 3,
                    // mainAxisSpacing: 16,
                    crossAxisCount: 2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
