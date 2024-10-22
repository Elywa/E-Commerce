import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnnouncementsWidgets extends StatelessWidget {
  const AnnouncementsWidgets({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
        isLoop: true,
        initialPage: 0,
        indicatorColor: AppColors.primaryColor,
        indicatorBackgroundColor: AppColors.whiteColor,
        autoPlayInterval: 5000,
        indicatorBottomPadding: 5.h,
        indicatorRadius: 5,
        children: images
            .map((url) => Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Image.asset(
                    url,
                    fit: BoxFit.fill,
                    width: 398.w,
                    height: 200.h,
                  ),
                ))
            .toList());
  }
}
