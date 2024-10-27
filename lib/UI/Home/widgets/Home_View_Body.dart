import 'package:e_commerce/UI/Home/cubits/Home%20Cubit/home_view_model_cubit.dart';
import 'package:e_commerce/UI/Utils/functions.dart';
import 'package:e_commerce/UI/Home/tabs/favourite%20tab/favourite_tab_view.dart';
import 'package:e_commerce/UI/Home/tabs/Products%20tab/products_tab.dart';
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
          bottomNavigationBar:
              buildCustomBottomNavigationBar(context, viewModel),
        );
      },
    );
  }
}
