import 'package:e_commerce/UI/Home/widgets/announcements_widgets.dart';
import 'package:e_commerce/UI/Home/widgets/custom_grid_view.dart';

import 'package:e_commerce/UI/Home/widgets/search_row.dart';
import 'package:e_commerce/UI/Home/widgets/two_items_custom_row.dart';
import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabView extends StatelessWidget {
  HomeTabView({super.key});
  List<String> images = [
    MyAssets.announcement1,
    MyAssets.announcement2,
    MyAssets.announcement3
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Column(
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
              height: 16.h,
            ),
            AnnouncementsWidgets(images: images),
            const SizedBox(
              height: 24,
            ),
            const TwoItemsCustomRow(text1: 'Categories', text2: 'view all'),
            const SizedBox(
              height: 16,
            ),
            const CustomGridView(),
            SizedBox(
              height: 24.h,
            ),
            const TwoItemsCustomRow(text1: 'products', text2: 'view all')
          ],
        ),
      ),
    );
  }
}
