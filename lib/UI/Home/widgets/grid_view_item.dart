import 'package:e_commerce/UI/Home/widgets/Home_View_Body.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: CircleAvatar(
            radius: 80.r,
            backgroundImage: const AssetImage(MyAssets.announcement1),
          ),
        ),
        // const SizedBox(
        //   height: ,
        // ),
        Expanded(
            flex: 2,
            child: Text(
              'Name',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                  ),
            ))
      ],
    );
  }
}
