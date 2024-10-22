import 'package:e_commerce/UI/Home/widgets/search_row.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:e_commerce/UI/Utils/functions.dart';
import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabView extends StatelessWidget {
  const HomeTabView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             SizedBox(
              height: 6,
            ),
             Image(
              image: AssetImage(MyAssets.routeImage),
            ),
             SizedBox(
              height: 17.5,
            ),
            SearchRow(),
          ],
        ),
      ),
    );
  }
}

