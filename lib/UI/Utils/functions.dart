import 'package:e_commerce/UI/Home/cubits/Home%20Cubit/home_view_model_cubit.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

SafeArea buildCustomBottomNavigationBar(
    BuildContext context, HomeViewModelCubit viewModel) {
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

void showErrorSnackBar(BuildContext context, String message , {double verical = 12} ) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          // const Icon(Icons.done, color: Colors.green, size: 28), // Gold icon
          // const SizedBox(width: 12),
          Expanded(
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(
          255, 42, 173, 233), // Dark purple to match the app
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin:  EdgeInsets.symmetric(horizontal: 16, vertical: verical),
      elevation: 6,
    ),
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

OutlineInputBorder buildBorders(Color color, int borderRadius) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius.r),
    borderSide: BorderSide(color: color),
  );
}
