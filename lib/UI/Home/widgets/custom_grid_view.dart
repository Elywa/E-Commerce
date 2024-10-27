import 'package:e_commerce/UI/Home/tabs/home%20tab/cubits/cubit/home_tab_cubit.dart';
import 'package:e_commerce/UI/Home/widgets/grid_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomGridView extends StatelessWidget {
   CustomGridView({super.key , required this.homeTabCubit});
  HomeTabCubit homeTabCubit ; 
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: homeTabCubit.categoriesList.length,
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (context, index) {
            return  GridViewItem(imagePath: homeTabCubit.categoriesList[index].image.toString(), name:homeTabCubit.categoriesList[index].name ,);
          }),
    );
  }
}
