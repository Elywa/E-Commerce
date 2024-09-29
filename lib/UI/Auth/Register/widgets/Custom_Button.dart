import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 20.h, bottom: 20.h, left: 16.w, right: 16.w),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            minimumSize:
                Size(double.infinity, MediaQuery.of(context).size.height * .07),
            backgroundColor: AppColors.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            )),
        onPressed: () {},
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.blueColor, fontSize: 22),
        ),
      ),
    );
  }
}
