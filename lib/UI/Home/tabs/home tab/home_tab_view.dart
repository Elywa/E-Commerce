import 'package:e_commerce/Domain/di.dart';
import 'package:e_commerce/UI/Home/tabs/Products%20tab/cubits/cubit/products_tab_view_model_cubit.dart';
import 'package:e_commerce/UI/Home/tabs/home%20tab/cubits/cubit/home_tab_cubit.dart';
import 'package:e_commerce/UI/Home/widgets/announcements_widgets.dart';
import 'package:e_commerce/UI/Home/widgets/custom_grid_view.dart';

import 'package:e_commerce/UI/Home/widgets/search_row.dart';
import 'package:e_commerce/UI/Home/widgets/two_items_custom_row.dart';
import 'package:e_commerce/UI/Utils/colors.dart';
import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeTabView extends StatelessWidget {
  HomeTabView({super.key});
  HomeTabCubit viewModel = HomeTabCubit(
      categoriesUseCase: injectGetAllCategoriesUseCase(),
      brandsUseCase: injectBrandsUseCase());
  List<String> images = [
    MyAssets.announcement1,
    MyAssets.announcement2,
    MyAssets.announcement3
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabCubit, HomeTabStates>(
      bloc: viewModel
        ..getAllCategories()
        ..getAllBrands(),
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 6,
                  ),
                  SearchRow(),
                  SizedBox(
                    height: 16.h,
                  ),
                  AnnouncementsWidgets(images: images),
                  const SizedBox(
                    height: 24,
                  ),
                  const TwoItemsCustomRow(
                      text1: 'Categories', text2: 'view all'),
                  const SizedBox(
                    height: 16,
                  ),
                  state is HomeTabLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : CustomGridView(
                          type: 'categories',
                          homeTabCubit: viewModel,
                        )

                  // if (state is HomeTabLoadingState) {
                  //   return const Center(child: CircularProgressIndicator());
                  // } else if (state is HomeTabFailureState) {
                  //   return Center(
                  //     child: Text(
                  //       state.error.toString(),
                  //       textAlign: TextAlign.center,
                  //       style: Theme.of(context)
                  //           .textTheme
                  //           .titleMedium!
                  //           .copyWith(
                  //               color: AppColors.primaryColor, fontSize: 18),
                  //     ),
                  //   );
                  // } else {
                  //   return CustomGridView(
                  //     homeTabCubit: viewModel,
                  //   );
                  // }

                  ,
                  SizedBox(
                    height: 24.h,
                  ),
                  const TwoItemsCustomRow(text1: 'Brands', text2: 'view all'),
                  const SizedBox(
                    height: 16,
                  ),
                  state is BrandsLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      : CustomGridView(
                          type: 'brands',
                          homeTabCubit: viewModel,
                        )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
