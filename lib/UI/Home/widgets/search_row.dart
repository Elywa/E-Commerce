import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:e_commerce/UI/Utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchRow extends StatelessWidget {
  const SearchRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                child: const Icon(
                  Icons.search,
                  size: 30,
                ),
              ),
              hintText: 'what do you search for?',
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: 17,
                  fontWeight: FontWeight.w300),
              enabledBorder: buildBorders(AppColors.primaryColor, 40),
            ),
          ),
        ),
        IconButton(
            onPressed: () {},
            style: const ButtonStyle(
              iconColor: WidgetStatePropertyAll(AppColors.primaryColor),
            ),
            icon: const Icon(
              Icons.shopping_cart_outlined,
              size: 30,
            ))
      ],
    );
  }
}