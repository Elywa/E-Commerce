import 'package:e_commerce/UI/Home/widgets/grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return const GridViewItem();
          }),
    );
  }
}
