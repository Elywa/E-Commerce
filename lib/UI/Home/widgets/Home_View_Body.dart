import 'package:e_commerce/UI/Home/cubits/Home%20Cubit/home_view_model_cubit.dart';
import 'package:e_commerce/UI/Home/tabs/favourite%20tab/favourite_tab_view.dart';
import 'package:e_commerce/UI/Home/tabs/home%20tab/home_tab_view.dart';
import 'package:e_commerce/UI/Home/tabs/product%20details%20tab/products_tab_details.dart';
import 'package:e_commerce/UI/Home/tabs/profile%20tab/profile_tab_view.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});
  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  HomeViewModelCubit viewModel = HomeViewModelCubit();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: viewModel,
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: viewModel.tabs[viewModel.selectedIndex],
          bottomNavigationBar: buildCustomBottomNavigationBar(),
        );
      },
    );
  }

  Widget buildIcon(String assetPath, bool isSelected) {
    return Container(
      width: 43.w,
      height: 40.h,
      decoration: isSelected
          ? const BoxDecoration(
              color: AppColors.whiteColor,
              shape: BoxShape.circle,
            )
          : null,
      child: ImageIcon(
        AssetImage(assetPath),
        size: 18.sp, // Reduced icon size to avoid overflow
        color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
      ),
    );
  }

  SafeArea buildCustomBottomNavigationBar() {
    return SafeArea(
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
        child: SizedBox(
          height: MediaQuery.of(context).size.height * .088,
          child: BottomNavigationBar(
            onTap: (value) {
              viewModel.changeTab(value);
            },
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedItemColor: AppColors.whiteColor,
            backgroundColor: AppColors.primaryColor,
            currentIndex: viewModel.selectedIndex,
            items: [
              BottomNavigationBarItem(
                label: 'Home',
                icon: buildIcon(
                  'assets/images/home_unselected.png',
                  viewModel.selectedIndex == 0,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Details',
                icon: buildIcon(
                  'assets/images/product_unselected.png',
                  viewModel.selectedIndex == 1,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Favourites',
                icon: buildIcon(
                  'assets/images/favourite_unselected.png',
                  viewModel.selectedIndex == 2,
                ),
              ),
              BottomNavigationBarItem(
                label: 'Profile',
                icon: buildIcon(
                  'assets/images/profile_unselected.png',
                  viewModel.selectedIndex == 3,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
