 import 'package:e_commerce/UI/Home/product_details_view.dart';
import 'package:e_commerce/UI/Home/tabs/Products%20tab/cubits/cubit/products_tab_view_model_cubit.dart';
import 'package:e_commerce/UI/Home/tabs/Products%20tab/widgets/product_item.dart';
import 'package:e_commerce/UI/Home/widgets/search_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

SingleChildScrollView buildProductSuccessStateTab(dynamic viewModel) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 6,
          ),
          const SearchRow(),
          SizedBox(
            height: 24.h,
          ),
          GridView.builder(
            itemCount: viewModel.productsList.length,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, ProductDetailsView.routeName,
                      arguments: viewModel.productsList[index]);
                },
                child: ProductItem(
                  id: viewModel.productsList[index].id,
                  imagePath: viewModel.productsList[index].images?[0],
                  description: viewModel.productsList[index].description,
                  price: viewModel.productsList[index].price,
                  rate: viewModel.productsList[index].ratingsAverage,
                  title: viewModel.productsList[index].title,
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // crossAxisSpacing: 16,
              childAspectRatio: 2.3 / 3,
              // mainAxisSpacing: 16,
              crossAxisCount: 2,
            ),
          ),
        ],
      ),
    );
  }


    SizedBox buildErrorWidget(BuildContext context, ProductsTabViewModelFailureState state) {
    return SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Center(
                  child: Text(
                    state.errorMessage.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.black),
                  ),
                ),
              );
  }