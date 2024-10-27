import 'package:e_commerce/UI/Home/widgets/search_row.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTabView extends StatelessWidget {
  const ProductsTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              height: 16.h,
            ),
          ]),
        ),
      ),
    );
  }
}
