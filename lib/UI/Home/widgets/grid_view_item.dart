import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridViewItem extends StatelessWidget {
  const GridViewItem({super.key, required this.imagePath, required this.name});
  final String? imagePath;
  final String? name;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: CircleAvatar(
            radius: 100.r,
            backgroundImage: NetworkImage(imagePath ??
                'https://e7.pngegg.com/pngimages/10/205/png-clipart-computer-icons-error-information-error-angle-triangle-thumbnail.png'),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            flex: 2,
            child: Text(
              name ?? 'Unknown',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColors.darkBrownColor,
                    fontSize: 18,
                  ),
            ))
      ],
    );
  }
}
