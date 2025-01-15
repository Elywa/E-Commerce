import 'package:e_commerce/Domain/di.dart';
import 'package:e_commerce/UI/Home/product_details_view.dart';
import 'package:e_commerce/UI/Home/tabs/Products%20tab/cubits/cubit/products_tab_view_model_cubit.dart';
import 'package:e_commerce/UI/Home/tabs/Products%20tab/widgets/functions.dart';
import 'package:e_commerce/UI/Home/tabs/Products%20tab/widgets/product_item.dart';
import 'package:e_commerce/UI/Home/widgets/search_row.dart';
import 'package:e_commerce/UI/Utils/functions.dart';
import 'package:e_commerce/UI/Utils/my_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsTabView extends StatefulWidget {
  const ProductsTabView({super.key});

  @override
  State<ProductsTabView> createState() => _ProductsTabViewState();
}

class _ProductsTabViewState extends State<ProductsTabView> {
  ProductsTabViewModelCubit viewModel = ProductsTabViewModelCubit(
      getAllProductsUseCase: injectGetAllProductsUseCase(),
      addCartProductUseCase: injectAddCartProductUseCase(),
      addProductToFavouriteUseCase: injectAddProductToFavouriteUseCase());
  @override
  // void initState() {
  //    viewModel.getAllProducts();
  // }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: BlocProvider<ProductsTabViewModelCubit>(
          create: (context) => viewModel..getAllProducts(),
          child: BlocConsumer<ProductsTabViewModelCubit,
              ProductsTabViewModelState>(
            listener: (context, state) {
              if (state is AddProductToCartSuccessState ||
                  state is FavouriteTabSuccess) {
                showErrorSnackBar(
                  context,
                  "Product Added Successfully",
                );
              }
              if (state is FavouriteTabFailure) {
                showErrorSnackBar(
                  context,
                  "Oops there is an error!",
                );
              }
            },
            builder: (context, state) {
              if (state is ProductsTabViewModelLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is ProductsTabViewModelFailureState) {
                return buildErrorWidget(context, state);
              } else if (state is ProductsTabViewModelSuccessState ||
                  state is AddProductToCartLoadingState ||
                  state is FavouriteTabLoading ||
                  state is FavouriteTabSuccess ||
                  state is FavouriteTabFailure) {
                return buildProductSuccessStateTab(viewModel);
              } else if (state is AddProductToCartSuccessState) {
                return buildProductSuccessStateTab(viewModel);
              } else if (state is AddProductToCartFailureState) {
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
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
