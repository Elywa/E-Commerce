import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TwoItemsCustomRow extends StatelessWidget {
  const TwoItemsCustomRow(
      {
        super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
          ),
          Text(
            text2,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
          )
        ],
      ),
    );
  }
}
